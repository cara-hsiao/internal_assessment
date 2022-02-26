
require('dotenv').config()

const mysql = require('mysql');
const util = require('util')

const dbConfig = {
  host: process.env.DB_HOST || "localhost",
  port: process.env.DB_PORT || 3306,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD, 
  database: process.env.DB_DATABASE,
  connectTimeout: parseInt(process.env.DB_CONNECT_TIMEOUT) || 10000
}

let pool = mysql.createPool(dbConfig);

pool.queryPromise = util.promisify(pool.query)

module.exports = pool;