const express = require('express');
const route = express.Router();
const multer = require('multer');
const router = require('./user');

const whileList = [
    'image/png',
    'image/jpeg',
    'image/jpg'
]
    
const fileStorageEngine = multer.diskStorage({
    destination: (req, file,cb)=>{
        cb(null, './uploads/category')
    },
    filename: (req, file, cb)=>{cb(null, req.headers.filename);}
});

const upload = multer ({
    storage: fileStorageEngine,
    fileFilter: (req, file, cb)=>{
        console.log(file.mimetype);
        if(!whileList.includes(file.mimetype)){
            return cb(new Error('file format is not allowed'));
        }
        cb(null, true);
    }
});

router.post('/', upload.single("photo"), (req, res, error)=>{
    try{
        res.send(req.file);
    }catch(err){
        err.send(400);
    }
});

module.exports = router;