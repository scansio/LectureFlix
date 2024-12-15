const { Pool } = require("pg");
require("dotenv").config(); // Load environment variables from .env

const coursesDB = new Pool({ connectionString: process.env.COURSES_DB_URL });
const usersDB = new Pool({ connectionString: process.env.USERS_DB_URL });
const analyticsDB = new Pool({
  connectionString: process.env.ANALYTICS_DB_URL,
});

module.exports = { coursesDB, usersDB, analyticsDB };
