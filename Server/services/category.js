const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getData(obj){
    const rows = await db.query(
        `call PrcCategory(?)`,
        [obj.token]
    );
    const data = helper.emptyOrRows(rows);
    return data[0]
}

async function saveData(obj){
    const rows = await db.query(
        `call PrcSaveCategory(?,?,?)`,
        [obj.token, obj.id, obj.name]
    );
    const data = helper.emptyOrRows(rows);
    return data[0]
}

async function deleteData(token, id){
    const rows = await db.query(
        `call PrcDeleteCategory(?,?)`,
        [token, id]
    );
    const data = helper.emptyOrRows(rows);
    return data[0]
}

module.exports = {
    getData,
    saveData,
    deleteData
}