/** @format */

const env = process.env;

const config = {
    db: {
        host: env.DB_HOST || '127.0.0.1',
        user: env.DB_USER || 'fary',
        password: env.DB_PASSWORD || '2137051',
        database: env.DB_NAME || 'shop',
    },
    listPerPage: env.LIST_PER_PAGE || 10,
    email: {
        email: 'fbakhsheshi@ymail.com',
        password: 'ljkqgawanlftqmiw',
    },
};

module.exports = {config};