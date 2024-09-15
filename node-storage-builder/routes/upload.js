const multiparty = require('connect-multiparty')
const tmpimages = multiparty({uploadDir:'./images'})
const { auth } = require('../middleware/auth')
const slug = require('slug')
var pdf = require("pdf-creator-node")
const fetch = require("node-fetch");
const path = require('path')
const fs = require('fs')

//const PDFWatermark= require('pdf-watermark');
const { degrees, PDFDocument, rgb, StandardFonts } = require('pdf-lib');

const multer = require("multer");

const Handlebars = require('handlebars');


Handlebars.registerHelper('inc', function(number, options) {
    if(typeof(number) === 'undefined' || number === null)
        return null;

    // Increment by inc parameter if it exists or just by one
    return number + (options.hash.inc || 1);
})

var storage = multer.diskStorage({

    destination: function (req, file, callback) {
        callback(null, 'images/')
    },
    
    filename: function (req, file, callback) {
        callback(null, Date.now() + path.extname(file.originalname))
    },
    
})

const uploader = multer({
    dest: "images/", 
    storage: storage,
    fileFilter: function (req, file, callback) {
        var ext = path.extname(file.originalname);
        if(ext !== '.png' && ext !== '.jpg' && ext !== '.png' && ext !== '.pdf') {
            req.resUpload = 'failed'
            return callback(null, false)
        }
        callback(null, true)
    }
});

const upload = app => {

    app.put("/storage/set", auth , uploader.single('upload'),(req, res) => {

        const file = req.file;
        
        if(req.resUpload == 'failed') {
            res.status(401).send(
                {
                    respond: {
                        status: 'failed',
                        response: "File type not supported",
                    }
                }
            );
        } else {
            if (!file) {
                res.status(400).send({
                    respond: {
                        status: 'failed',
                        response: "No File Selected",
                    }
                });
            }
        }

        // set group data asset folder per Company
        const CompanyCode = req.CompanyCode

        const targetPathUrl = path.join(__dirname,"../public/uploads/"+file.filename)
        const targetDir = path.join(__dirname,"../public/uploads/")
        
        if (!fs.existsSync(targetDir)){
            fs.mkdirSync(targetDir);
        }

        
        fs.rename(file.path, targetPathUrl, err => {

            if(err) {
                res.send({
                    respond: { status: 'error', response: err }
                })
            }

            res.status(200).send({
                respond: {
                    uploaded: true,
                    images: file.filename,
                    url: process.env.URL_BASE+process.env.PORTS+`/image/get/${file.filename}`
                }
            })

        })

    
    })


    app.post('/storage/set', auth , tmpimages, (req,res) => {
        
        var TempFile = req.files.upload
        console.log(TempFile)
        if(req.files.upload != undefined) {
        var TempPathFile = TempFile.path
        
        const targetPathUrl = path.join(__dirname,"../public/uploads/"+TempFile.name)
        const targetDir = path.join(__dirname,"../public/uploads/")
        
        if (!fs.existsSync(targetDir)){
            fs.mkdirSync(targetDir);
        }
        
        if(path.extname(TempFile.originalFilename).toLowerCase() === ".png" || path.extname(TempFile.originalFilename).toLowerCase() === ".jpg" || path.extname(TempFile.originalFilename).toLowerCase() === ".pdf") {
            
            fs.rename(TempPathFile, targetPathUrl, err => {

            if(err) {
                res.send({status: 'error', response: err})
            }

            res.status(200).send({
                uploaded: true,
                images: TempFile.originalFilename,
                url: process.env.URL_BASE+process.env.PORTS+`/image/get/${TempFile.originalFilename}`
            })

            })
        } else {
            res.status(401).send({respond: {status:'failed', response: 'file not supported'}})
        }
        } else {
            res.send({respond: {status:'error', response: 'upload error, contact developer'}})
        }

    })

  
    app.get('/storage/get/:images' , function (req, res) {
        
        const fileName = req.params.images
        const targetPathUrl = path.join(__dirname,"../public/uploads/"+fileName)
        
        if (!fs.existsSync(targetPathUrl)){
        res.json({respond: {status: 'failed', response: 'image not found'}})
        } else {
        res.sendFile(targetPathUrl)
        }

    })

}

module.exports = upload