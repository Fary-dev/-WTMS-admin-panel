const express =require('express');
const router = express.Router();
const dataService = require('../services/product');

router.get('/', async function(req, res, next){
    try{
        res.json(await dataService.getData(req.headers));
    }catch(err){
        console.error(`Error receving data from server`, err.message);
        next(err);
    }
});

router.put('/', async function(req, res, next){
    try{
        if(req.body.token)
            res.json(await dataService.saveData(req.body));
        else
            throw new Error("token not found");
    }catch(err){
        console.error(`Error saving data on server`, err.message);
        next(err);
    }
});

router.delete('/:id', async function(req, res, next){
    try{
        if(req.headers.token)
            res.json(await dataService.deleteData(req.headers.token, parseInt(req.params.id)));
        else
            throw new Error("token not found");
    }catch(err){
        console.error(`Error deleting data on server`, err.message);
        next(err);
    }
});

router.get('/info', async function(req, res, next){
    try{
        res.json(await dataService.getDataInfoProduct(req.headers));
    }catch(err){
        console.error(`Error receving data from server`, err.message);
        next(err);
    }
});

router.put('/info', async function(req, res, next){
    try{
        if(req.body.token)
            res.json(await dataService.saveDataInfoProduct(req.body));
        else
            throw new Error("token not found");
    }catch(err){
        console.error(`Error saving data on server`, err.message);
        next(err);
    }
});

router.delete('/info/:id', async function(req, res, next){
    try{
        if(req.headers.token)
            res.json(await dataService.deleteDataInfoProduct(req.headers.token, parseInt(req.params.id)));
        else
            throw new Error("token not found");
    }catch(err){
        console.error(`Error deleting data on server`, err.message);
        next(err);
    }
});

module.exports = router;