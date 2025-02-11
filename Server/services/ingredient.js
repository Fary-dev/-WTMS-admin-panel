/** @format */

const db = require('./db');
const helper = require('../helper');
const { config } = require('../config');

async function getData(obj) {
    const rows = await db.query(`call PrcIngredient(?)`, [obj.token]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function getOneData(obj) {
    const rows = await db.query(`call PrcFromOneIngredient(?,?)`, [
        obj.token,
        parseInt(obj.product),
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function saveData(obj) {
    const rows = await db.query(`call PrcSaveIngredient(?,?,?,?,?,?,?)`, [
        obj.token,
        obj.id,
        obj.iName,
        obj.price,
        obj.brand,
        obj.descript,
        obj.isAvailable,
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function deleteData(token, id) {
    const rows = await db.query(`call PrcDeleteIngredient(?,?)`, [token, id]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

module.exports = {
    getData,
    getOneData,
    saveData,
    deleteData,
};