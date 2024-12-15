const fs = require("fs");
const path = require("path");
const {
  coursesDB,
  usersDB,
  analyticsDB,
  ensureDatabasesExist,
} = require("./db");

const migrations = [
  { db: coursesDB, folder: "migrations", prefix: "courses" },
  { db: usersDB, folder: "migrations", prefix: "users" },
  { db: analyticsDB, folder: "migrations", prefix: "analytics" },
];

async function runMigrations() {
  for (const { db, folder, prefix } of migrations) {
    const folderPath = path.join(__dirname, folder);
    const files = fs
      .readdirSync(folderPath)
      .filter((file) => file.includes(prefix))
      .sort();

    for (const file of files) {
      const filePath = path.join(folderPath, file);
      const sql = fs.readFileSync(filePath, "utf8");
      try {
        console.log(`Running migration: ${file}`);
        await db.query(sql);
      } catch (err) {
        console.error(`Error running migration ${file}:`, err);
      }
    }
  }
  console.log("All migrations completed!");
}

// Run the function to ensure databases exist
ensureDatabasesExist()
  .then(() =>
    runMigrations()
      .then(() => process.exit(0))
      .catch((err) => {
        console.error("Migration error:", err);
        process.exit(1);
      })
  )
  .catch((err) => console.error("Error ensuring databases:", err));
