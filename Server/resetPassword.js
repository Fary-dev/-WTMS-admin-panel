/** @format */

var nodemailer = require('nodemailer');
const { config } = require('./config');

async function reset(req) {
    let testAccount = await nodemailer.createTestAccount();
    var transporter = nodemailer.createTransport({
        service: 'Yahoo',
        secure: false,
        auth: {
            user: config.email.email,
            pass: config.email.password,
        },
    });

    var mailOptions = {
        from: config.email.email,
        to: req.vemail,
        subject: 'Resset password',
        html: `<h3>Hey there! </h3><br> 
        <p>This is your Code: <b>${req.vpassword}</b></p>`,
    };

    transporter.sendMail(mailOptions, function(error, info) {
        if (error) {
            console.log(error);
        } else {
            console.log('Email sent: ' + info.response);
        }
    });
}

module.exports = { reset };