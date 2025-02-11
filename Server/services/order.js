/** @format */

const db = require('./db');
const helper = require('../helper');
const { config } = require('../config');

async function getData(obj) {
    const rows = await db.query(`call PrcOrderDetails(?,?)`, [
        obj.token,
        parseInt(obj.orderId),
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function saveData(obj) {
    const rows = await db.query(`call PrcSAveOrderDetails(?,?,?,?,?,?)`, [
        obj.token,
        obj.id,
        obj.proId,
        obj.descript,
        obj.quantity,
        obj.descript,
        obj.totalamount,
    ]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

async function deleteData(token, id) {
    const rows = await db.query(`call PrcSAveOrderDetails(?,?)`, [token, id]);
    const data = helper.emptyOrRows(rows);
    return data[0];
}

module.exports = {
    getData,
    saveData,
    deleteData,
};