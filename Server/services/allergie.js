const db = require('./db');
const helper = require('../helper');
const config = require('../config');

async function getData(obj){
    const rows = await db.query(
        `call PrcAllergie(?)`,
        [obj.token]
    );
    const data = helper.emptyOrRows(rows);
    return data[0]
}

async function saveData(obj){
    const rows = await db.query(
        `call PrcSaveAllergie(?,?,?,?)`,
        [obj.token, obj.id, obj.aName, obj.descript]
    );
    const data = helper.emptyOrRows(rows);
    return data[0]
}

async function deleteData(token, id){
    const rows = await db.query(
        `call PrcDeleteAllergiet(?,?)`,
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