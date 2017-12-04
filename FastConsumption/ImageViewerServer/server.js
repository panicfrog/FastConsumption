const express = require('express');
const hbs = require('hbs');
const fs = require('fs');
const path = require('path');

const app = express()

app.use('/static',express.static( __dirname + '/public'))
app.set('view engine', 'hbs');
hbs.registerPartials(__dirname + '/views/partials')

app.get('/',(req,res) => {

    var asserts = []

    travel(__dirname+'/../FastConsumption/Assets/Assets.xcassets',(pathname)=> {
        let component = pathname.split(".")[1];
        if ( component && component.length < 6 && component > 2) {
            console.log(component)
        }
        if (component === 'png' || component === 'jpg') {
            asserts.push(pathname)
        }
    });

    res.render('index',{
        title: 'Assert Resource',
        copyRight: `Create By Ye-yongping  ${new Date().getFullYear()}`
    })
})

app.get('/images',(req,res) => {

})

function travel(dir, callback) {
    fs.readdirSync(dir).forEach(function (file) {
        var pathname = path.join(dir, file);
        if (fs.statSync(pathname).isDirectory() ) {
            travel(pathname, callback);
        } else {
            callback(pathname);
        }
    });
}


app.listen(8888)