// /** @format */

// const db = require('./db');
// const helper = require('../helper');
// const { reset } = require('../resetPassword');

// async function getAllData(user) {
//     const rows = await db.query(`call shop.PrcUsers(?,?,?)`, [
//         user.token,
//         user.type,
//         user.id,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function getData(user) {
//     const rows = await db.query(`call shop.PrcUser(?,?)`, [
//         user.token,
//         user.type,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function authenticate(user) {
//     const rows = await db.query(`call shop.PrcAuthenticate(?,?,?,?)`, [
//         user.vip,
//         // header['sec-ch-ua'] + '-' + header['user-agent'],
//         user.vbrowser,
//         user.vmobile,
//         user.vpass,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function verifyByToken(user) {
//     const rows = await db.query(`call shop.PrcVerifyByToken(?)`, [user.token]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function resetPassword(user) {
//     const rows = await db.query(`call shop.PrcResetPassword(?,?,?,?)`, [
//         // header['sec-ch-ua'] + '-' + header['user-agent'],
//         user.vip,
//         user.vbrowser,
//         user.vemail,
//         user.vpassword,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     reset(user);
//     return data[0];
// }
// async function updatePassword(header, user) {
//     const rows = await db.query(`call shop.PrcUpdatePassword(?,?,?,?,?)`, [
//         header.host,
//         header['sec-ch-ua'] + '-' + header['user-agent'],
//         user.token,
//         user.id,
//         user.pass,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function saveData(user) {
//     const rows = await db.query(
//         `call shop.PrcSaveUserInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?)`, [
//             user.vip,
//             user.vbrowser,
//             user.vid,
//             user.vtoken,
//             user.vfname,
//             user.vlname,
//             user.vmobile,
//             user.vemail,
//             user.vpassword,
//             user.vaddress,
//             user.vtype,
//             user.vadmin,
//             user.vactive,
//             user.vimage,
//         ]
//     );
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// async function updateData(user) {
//     const rows = await db.query(
//         `call shop.PrcUpdateUserInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?)`, [
//             user.vip,
//             user.vbrowser,
//             user.vid,
//             user.vtoken,
//             user.vfname,
//             user.vlname,
//             user.vmobile,
//             user.vemail,
//             user.vpassword,
//             user.vaddress,
//             user.vtype,
//             user.vadmin,
//             user.vactive,
//             user.vimage,
//         ]
//     );
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// // async function saveData(header, id, user) {
// //   const rows = await db.query(
// //     `call shop.PrcSaveUserInfo(?,?,?,?,?,?,?,?,?,?,?,?,?,?)`,
// //     [
// //       header.vip,
// //       header.vbrowser,
// //       id.vid,
// //       user.vtoken,
// //       user.vfname,
// //       user.vlname,
// //       user.vmobile,
// //       user.vemail,
// //       user.vpassword,
// //       user.vaddress,
// //       user.vtype,
// //       user.vadmin,
// //       user.vactive,
// //       user.vimage,
// //     ]
// //   );
// //   const data = helper.emptyOrRows(rows);
// //   return data[0];
// // }

// async function deleteData(header, id) {
//     const rows = await db.query(`call PrcDeleteUser(?,?,?,?)`, [
//         header.host,
//         header['sec-ch-ua'] + '-' + header['user-agent'],
//         header.token,
//         id,
//     ]);
//     const data = helper.emptyOrRows(rows);
//     return data[0];
// }

// module.exports = {
//     getAllData,
//     getData,
//     authenticate,
//     verifyByToken,
//     resetPassword,
//     updatePassword,
//     saveData,
//     updateData,
//     deleteData,
// };

/* ------------------------------------------------------------------------------------------------ */

/** @format */

const db = require('./db');
const helper = require('../helper');

// Funktion zum Abrufen aller Rollen
async function getAllRoles() {
    try {
        const rows = await db.query(`CALL getAllRoles()`);  // Abrufen aller Rollen
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getAllRoles:', err.message);
        throw err;
    }
}

// Funktion zum Abrufen einer Rolle anhand der ID
async function getRoleById(role_id) {
    try {
        const rows = await db.query(`CALL getRoleById(?)`, [role_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getRoleById:', err.message);
        throw err;
    }
}

// Funktion zum Hinzufügen einer neuen Rolle
async function addRole(role) {
    try {
        const rows = await db.query(`CALL addRole(?)`, [role.name]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in addRole:', err.message);
        throw err;
    }
}

// Funktion zum Aktualisieren einer Rolle
async function updateRole(role) {
    try {
        const rows = await db.query(`CALL updateRole(?, ?)`, [role.role_id, role.name]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in updateRole:', err.message);
        throw err;
    }
}

// Funktion zum Löschen einer Rolle
async function deleteRole(role_id) {
    try {
        const rows = await db.query(`CALL deleteRole(?)`, [role_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in deleteRole:', err.message);
        throw err;
    }
}

// Funktion zum Abrufen der Adresse eines Benutzers
async function getUserAddress(user_id) {
    try {
        const rows = await db.query(`CALL getUserAddress(?)`, [user_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getUserAddress:', err.message);
        throw err;
    }
}

// Funktion zum Hinzufügen oder Aktualisieren der Adresse eines Benutzers
async function saveUserAddress(user_id, address) {
    try {
        const rows = await db.query(`CALL saveUserAddress(?, ?, ?, ?, ?)`, [
            user_id,
            address.street,
            address.city,
            address.zip_code,
            address.country,
        ]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in saveUserAddress:', err.message);
        throw err;
    }
}

// Funktion zum Löschen der Adresse eines Benutzers
async function deleteUserAddress(user_id) {
    try {
        const rows = await db.query(`CALL deleteUserAddress(?)`, [user_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in deleteUserAddress:', err.message);
        throw err;
    }
}

// Funktion zum Abrufen des Benutzerstatus
async function getUserStatus(user_id) {
    try {
        const rows = await db.query(`CALL getUserStatus(?)`, [user_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getUserStatus:', err.message);
        throw err;
    }
}

// Funktion zum Hinzufügen oder Aktualisieren des Benutzerstatus
async function updateUserStatus(user_id, status_id) {
    try {
        const rows = await db.query(`CALL updateUserStatus(?, ?)`, [user_id, status_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in updateUserStatus:', err.message);
        throw err;
    }
}

// Funktion zum Löschen des Benutzerstatus
async function deleteUserStatus(user_id) {
    try {
        const rows = await db.query(`CALL deleteUserStatus(?)`, [user_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in deleteUserStatus:', err.message);
        throw err;
    }
}

// Funktion zum Abrufen eines einzelnen Benutzers
async function getUserData(user) {
    try {
        const rows = await db.query(`CALL getUser(?, ?)`, [user.user_id, user.token]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getUserData:', err.message);
        throw err;
    }
}

// Funktion zum Authentifizieren eines Benutzers
async function authenticate(user) {
    try {
        const rows = await db.query(`CALL authenticateUser(?, ?)`, [
            user.email_or_phone,
            user.password
        ]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in authenticate:', err.message);
        throw err;
    }
}

// Funktion zum Hinzufügen eines Benutzers
async function saveUserData(user) {
    try {
        const rows = await db.query(
            `CALL addUser(?, ?, ?, ?, ?, ?, ?)`, [
                user.first_name,
                user.last_name,
                user.phone_number,
                user.title,
                user.email,
                user.photo_url,
                user.role_id,
            ]
        );
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in saveUserData:', err.message);
        throw err;
    }
}

// Funktion zum Aktualisieren eines Benutzers
async function updateUserData(user) {
    try {
        const rows = await db.query(`CALL updateUser(?, ?, ?, ?, ?, ?, ?, ?, ?)`, [
            user.user_id,
            user.first_name,
            user.last_name,
            user.phone_number,
            user.email,
            user.photo_url,
            user.role_id,
            user.status,        // Status
            user.password,      // Passwort
        ]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in updateUserData:', err.message);
        throw err;
    }
}

// Funktion zum Löschen eines Benutzers
async function deleteUserData(user) {
    try {
        const rows = await db.query(`DELETE FROM users WHERE user_id = ?`, [user.user_id]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in deleteUserData:', err.message);
        throw err;
    }
}

// Funktion zum Abrufen aller Benutzer
async function getAllUsersData(user) {
    try {
        const rows = await db.query(`CALL getAllUsers(?, ?)`, [user.user_id, user.token]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in getAllUsersData:', err.message);
        throw err;
    }
}

// Funktion zum Zurücksetzen des Passworts mit Token
async function resetPassword(user) {
    try {
        const rows = await db.query(`CALL resetPasswordWithToken(?, ?, ?)`, [
            user.email_or_phone,
            user.verification_code,
            user.new_password
        ]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in resetPassword:', err.message);
        throw err;
    }
}

// Funktion zum Verifizieren eines Benutzers durch Token
async function verifyByToken(user) {
    try {
        const rows = await db.query(`CALL verifyByToken(?)`, [user.token]);
        const data = helper.emptyOrRows(rows);
        return data;
    } catch (err) {
        console.error('Error in verifyByToken:', err.message);
        throw err;
    }
}

module.exports = {
    getAllRoles,
    getRoleById,
    addRole,
    updateRole,
    deleteRole,
    getUserAddress,
    saveUserAddress,
    deleteUserAddress,
    getUserStatus,
    updateUserStatus,
    deleteUserStatus,
    getUserData,
    authenticate,
    saveUserData,
    updateUserData,
    deleteUserData,
    getAllUsersData,
    resetPassword,
    verifyByToken,
};
