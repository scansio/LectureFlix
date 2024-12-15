const { Pool } = require("pg");
require("dotenv").config();

// Function to drop a database if it exists
async function dropDatabaseIfExists(client, dbName) {
  try {
    const res = await client.query(
      `SELECT 1 FROM pg_database WHERE datname = $1`,
      [dbName]
    );
    if (res.rowCount > 0) {
      await client.query(`DROP DATABASE ${dbName}`);
      console.log(`Database "${dbName}" dropped successfully.`);
    }
  } catch (err) {
    console.error(`Error dropping database ${dbName}:`, err);
  }
}

// Function to create a database if it does not exist
async function createDatabaseIfNotExists(dbUrl = "") {
  const splitted = dbUrl.split("/");
  const dbName = splitted.slice(-1).join("").trim();
  const connectionString = splitted.slice(0, -1).join("/");

  const client = new Pool({
    connectionString,
  });

  try {
    // Check if the database exists by attempting to connect to it
    await client.query(`SELECT 1 FROM pg_database WHERE datname = '${dbName}'`);
  } catch (err) {
    console.error(`Error checking database ${dbName}:`, err);
    return;
  }

  await dropDatabaseIfExists(client, dbName);

  try {
    // Create the database if it doesn't exist
    await client.query(`CREATE DATABASE ${dbName}`);
    console.log(`Database "${dbName}" created successfully.`);
  } catch (err) {
    // If the database already exists, ignore the error
    if (err.code !== "42P04") {
      console.error(`Error creating database ${dbName}:`, err);
    }
  } finally {
    // Close the client
    await client.end();
  }
}

// Ensure all the required databases exist
async function ensureDatabasesExist() {
  const databases = [
    process.env.COURSES_DB_URL,
    process.env.USERS_DB_URL,
    process.env.ANALYTICS_DB_URL,
  ];

  for (const dbUrl of databases) {
    await createDatabaseIfNotExists(dbUrl);
  }
}

// Initialize connections for each database
const coursesDB = new Pool({ connectionString: process.env.COURSES_DB_URL });
const usersDB = new Pool({ connectionString: process.env.USERS_DB_URL });
const analyticsDB = new Pool({
  connectionString: process.env.ANALYTICS_DB_URL,
});

module.exports = { coursesDB, usersDB, analyticsDB, ensureDatabasesExist };
