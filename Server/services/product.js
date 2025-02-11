/** @format */

const db = require('./db');
const helper = require('../helper');
const { config } = require('../config');

async function getData(obj) {
    const rows = await db.query(`call PrcProduct(?,?)`, [
        obj.token,
        parseInt(obj.category),
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function saveData(obj) {
    const rows = await db.query(`call PrcSaveProduct(?,?,?,?,?,?,?,?,?,?)`, [
        obj.token,
        obj.id,
        obj.pName,
        obj.isAvailable,
        obj.descript,
        obj.sale,
        obj.info,
        obj.price,
        obj.categoryId,
        obj.userId,
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function deleteData(token, id) {
    const rows = await db.query(`call PrcDeleteProduct(?,?)`, [token, id]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function getDataInfoProduct(obj) {
    const rows = await db.query(`call PrcInfoProduct(?,?)`, [
        obj.token,
        parseInt(obj.id),
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function saveDataInfoProduct(obj) {
    const rows = await db.query(`call PrcSaveInfoProduct(?,?,?,?,?,?)`, [
        obj.token,
        obj.id,
        obj.proId,
        obj.size,
        obj.price,
        obj.userId,
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function deleteDataInfoProduct(token, id) {
    const rows = await db.query(`call PrcDeleteInfoProduct(?,?)`, [token, id]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

module.exports = {
    getData,
    saveData,
    deleteData,
    getDataInfoProduct,
    saveDataInfoProduct,
    deleteDataInfoProduct,
};