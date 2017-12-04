//
//  MutexLock.swift
//

#if os(Linux)
	import Glibc
#else
	import Darwin
#endif

/// 基础互斥协议,只有互斥调用的方式的方法
public protocol ScopedMutex {
	/// Perform work inside the mutex
	func sync<R>(execute work: () throws -> R) rethrows -> R
	func trySync<R>(execute work: () throws -> R) rethrows -> R?
}

/// 对互斥的定制性的协议加入了对应的具体的操作方法和一个锁对象
public protocol RawMutex: ScopedMutex {
	associatedtype MutexPrimitive

	/// The raw primitive is exposed as an "unsafe" public property for faster access in some cases
	var unsafeMutex: MutexPrimitive { get set }

	func unbalancedLock()
	func unbalancedTryLock() -> Bool
	func unbalancedUnlock()
}

extension RawMutex {
	/**
~~~
private extension UnfairLock {
	func fastsync<R>(execute work: @noescape () throws -> R) rethrows -> R {
		os_unfair_lock_lock(&unsafeLock)
		defer { os_unfair_lock_unlock(&unsafeLock) }
		return try work()
	}
}
private extension PThreadMutex {
	func fastsync<R>(execute work: @noescape () throws -> R) rethrows -> R {
		pthread_mutex_lock(&unsafeMutex)
		defer { pthread_mutex_unlock(&unsafeMutex) }
		return try work()
	}
}
~~~
	*/
	public func sync<R>(execute work: () throws -> R) rethrows -> R {
		unbalancedLock()
		defer { unbalancedUnlock() }
		return try work()
	}
	public func trySync<R>(execute work: () throws -> R) rethrows -> R? {
		guard unbalancedTryLock() else { return nil }
		defer { unbalancedUnlock() }
		return try work()
	}
}

/// 基于`pthread_mutex_t`(安全的"FIFO"互斥锁)的基本封装,类型包括 "NORMAL" 和 "RECURSIVE". 用类来封装可以更好的管理 `pthread_mutex_t`的生命周期 预防发生异常的情况.
public final class PThreadMutex: RawMutex {
	public typealias MutexPrimitive = pthread_mutex_t

    //互斥锁的类型: 非递归使用 "PTHREAD_MUTEX_NORMAL"  递归使用 "PTHREAD_MUTEX_RECURSIVE".
	public enum PThreadMutexType {
		case normal
		case recursive
	}

	public var unsafeMutex = pthread_mutex_t()
	
	///默认是普通模式, 可以创建递归锁
	public init(type: PThreadMutexType = .normal) {
		var attr = pthread_mutexattr_t()
		guard pthread_mutexattr_init(&attr) == 0 else {
			preconditionFailure()
		}
		switch type {
		case .normal:
			pthread_mutexattr_settype(&attr, Int32(PTHREAD_MUTEX_NORMAL))
		case .recursive:
			pthread_mutexattr_settype(&attr, Int32(PTHREAD_MUTEX_RECURSIVE))
		}
		guard pthread_mutex_init(&unsafeMutex, &attr) == 0 else {
			preconditionFailure()
		}
		pthread_mutexattr_destroy(&attr)
	}
	
	deinit {
		pthread_mutex_destroy(&unsafeMutex)
	}
	
	public func unbalancedLock() {
		pthread_mutex_lock(&unsafeMutex)
	}
	
	public func unbalancedTryLock() -> Bool {
		return pthread_mutex_trylock(&unsafeMutex) == 0
	}
	
	public func unbalancedUnlock() {
		pthread_mutex_unlock(&unsafeMutex)
	}
}

/// 对于`os_unfair_lock` (非FIFO的锁,苹果为了取代OSSPinLock新出的一个锁, 一个高级的能够避免优先级带来的死锁问题的一个锁, OSSPinLock之前就爆出在iOS平台有由于优先级造成死锁的问题)的封装. 用类来封装, 管理`os_unfair_lock`的生命周期.
/// 注意: 这个锁的应用场景和自旋一样, 适用于小场景下的高效的一个锁, 否则会造成大量消耗cpu资源的情况
@available(OSX 10.12, iOS 10, tvOS 10, *)
public final class UnfairLock: RawMutex {
	public typealias MutexPrimitive = os_unfair_lock
	
	public init() {
	}
	
	public var unsafeMutex = os_unfair_lock()
	
	public func unbalancedLock() {
		os_unfair_lock_lock(&unsafeMutex)
	}
	
	public func unbalancedTryLock() -> Bool {
		return os_unfair_lock_trylock(&unsafeMutex)
	}
	
	public func unbalancedUnlock() {
		os_unfair_lock_unlock(&unsafeMutex)
	}
}
