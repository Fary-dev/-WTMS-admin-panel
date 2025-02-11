// /** @format */

// const express = require('express');
// const { Int } = require('mssql');
// const router = express.Router();
// const userService = require('../services/user');
// const axios = require('axios').default;

// router.get('/all', async function(req, res, next) {
//     try {
//         res.json(await userService.getAllData(req.headers));
//     } catch (err) {
//         console.error(`Error while getting data from Database:`, err.message);
//         next(err);
//     }
// });

// router.get('/', async function(req, res, next) {
//     try {
//         res.json(await userService.getData(req.headers));
//     } catch (err) {
//         console.error(`Error while getting data from Database:`, err.message);
//         next(err);
//     }
// });

// router.post('/authenticate', async function(req, res, next) {
//     try {
//         res.json(await userService.authenticate(req.body));
//     } catch (err) {
//         console.log(`Error while authenticating:`, err.massage);
//         next(err);
//     }
// });

// router.post('/verifyByToken', async function(req, res, next) {
//     try {
//         res.json(await userService.verifyByToken(req.body));
//     } catch (err) {
//         console.log(`Error while verify by token:`, err.massage);
//         next(err);
//     }
// });

// router.post('/resetPassword', async function(req, res, next) {
//     try {
//         res.json(await userService.resetPassword(req.body));
//         // .then(() => resetPassword(req.body));
//     } catch (err) {
//         console.log(`Error while reseting password:`, err.massage);
//         next(err);
//     }
// });
// router.post('/updatePassword', async function(req, res, next) {
//     try {
//         res.json(await userService.resetPassword(req.headers, req.body));
//     } catch (err) {
//         console.log(`Error while reseting password:`, err.massage);
//         next(err);
//     }
// });

// router.post('/add', async function(req, res, next) {
//     try {
//         res.json(await userService.saveData(req.body));
//     } catch (err) {
//         console.log(`Error while add user info:`, err.message);
//         next(err);
//     }
// });

// router.put('/update', async function(req, res, next) {
//     try {
//         res.json(await userService.updateData(req.body));
//     } catch (err) {
//         console.log(`Error while editing user info:`, err.massage);
//         next(err);
//     }
// });

// // router.put('/:id', async function (req, res, next) {
// //   try {
// //     res.json(
// //       await userService.saveData(req.headers, req.body, parseInt(req.params.id))
// //     );
// //   } catch (err) {
// //     console.log(`Error while editing user info`, err.massage);
// //     next(err);
// //   }
// // });

// router.delete('/:id', async function(req, res, next) {
//     try {
//         res.json(
//             await userService.deleteData(req.headers, parseInt(req.params.id))
//         );
//     } catch (err) {
//         console.log(`Error while delete user info:`, err.massage);
//         next(err);
//     }
// });

// module.exports = router;

/** @format */

const express = require('express');
const router = express.Router();
const userService = require('../services/user');

// Endpoints für Rollen (Rollers)
router.get('/roles', async function(req, res, next) {
    try {
        res.json(await userService.getAllRoles());
    } catch (err) {
        console.error('Error while getting roles:', err.message);
        next(err);
    }
});

router.get('/role/:id', async function(req, res, next) {
    try {
        res.json(await userService.getRoleById(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while getting role by ID:', err.message);
        next(err);
    }
});

router.post('/role', async function(req, res, next) {
    try {
        res.json(await userService.addRole(req.body));
    } catch (err) {
        console.error('Error while adding role:', err.message);
        next(err);
    }
});

router.put('/role', async function(req, res, next) {
    try {
        res.json(await userService.updateRole(req.body));
    } catch (err) {
        console.error('Error while updating role:', err.message);
        next(err);
    }
});

router.delete('/role/:id', async function(req, res, next) {
    try {
        res.json(await userService.deleteRole(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while deleting role:', err.message);
        next(err);
    }
});

// Endpoints für Benutzeradresse (User Address)
router.get('/user/:id/address', async function(req, res, next) {
    try {
        res.json(await userService.getUserAddress(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while getting user address:', err.message);
        next(err);
    }
});

router.post('/user/:id/address', async function(req, res, next) {
    try {
        res.json(await userService.saveUserAddress(parseInt(req.params.id), req.body));
    } catch (err) {
        console.error('Error while saving/updating user address:', err.message);
        next(err);
    }
});

router.delete('/user/:id/address', async function(req, res, next) {
    try {
        res.json(await userService.deleteUserAddress(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while deleting user address:', err.message);
        next(err);
    }
});

// Endpoints für Benutzerstatus (User Status)
router.get('/user/:id/status', async function(req, res, next) {
    try {
        res.json(await userService.getUserStatus(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while getting user status:', err.message);
        next(err);
    }
});

router.put('/user/:id/status', async function(req, res, next) {
    try {
        res.json(await userService.updateUserStatus(parseInt(req.params.id), req.body.status_id));
    } catch (err) {
        console.error('Error while updating user status:', err.message);
        next(err);
    }
});

router.delete('/user/:id/status', async function(req, res, next) {
    try {
        res.json(await userService.deleteUserStatus(parseInt(req.params.id)));
    } catch (err) {
        console.error('Error while deleting user status:', err.message);
        next(err);
    }
});

// Endpoints für Authentifizierung und Benutzeroperationen
router.get('/all', async function(req, res, next) {
    try {
        res.json(await userService.getAllUsersData(req.headers));
    } catch (err) {
        console.error(`Error while getting data from Database:`, err.message);
        next(err);
    }
});

router.get('/', async function(req, res, next) {
    try {
        res.json(await userService.getUserData(req.headers));
    } catch (err) {
        console.error(`Error while getting data from Database:`, err.message);
        next(err);
    }
});

router.post('/authenticate', async function(req, res, next) {
    try {
        res.json(await userService.authenticate(req.body));
    } catch (err) {
        console.log(`Error while authenticating:`, err.message);
        next(err);
    }
});

router.post('/verifyByToken', async function(req, res, next) {
    try {
        res.json(await userService.verifyByToken(req.body));
    } catch (err) {
        console.log(`Error while verify by token:`, err.message);
        next(err);
    }
});

router.post('/resetPassword', async function(req, res, next) {
    try {
        res.json(await userService.resetPassword(req.body));
    } catch (err) {
        console.log(`Error while resetting password:`, err.message);
        next(err);
    }
});

router.post('/updatePassword', async function(req, res, next) {
    try {
        res.json(await userService.resetPassword(req.headers, req.body));
    } catch (err) {
        console.log(`Error while resetting password:`, err.message);
        next(err);
    }
});

router.post('/add', async function(req, res, next) {
    try {
        res.json(await userService.saveUserData(req.body));
    } catch (err) {
        console.log(`Error while adding user info:`, err.message);
        next(err);
    }
});

router.put('/update', async function(req, res, next) {
    try {
        res.json(await userService.updateUserData(req.body));
    } catch (err) {
        console.log(`Error while editing user info:`, err.message);
        next(err);
    }
});

router.delete('/:id', async function(req, res, next) {
    try {
        res.json(await userService.deleteUserData({ user_id: parseInt(req.params.id) }));
    } catch (err) {
        console.log(`Error while deleting user info:`, err.message);
        next(err);
    }
});

module.exports = router;
