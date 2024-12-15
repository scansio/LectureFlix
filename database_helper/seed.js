const fs = require('fs');
const path = require('path');
const { coursesDB, usersDB, analyticsDB } = require('./db');

const seeds = [
  { db: coursesDB, folder: 'seeds', prefix: 'courses' },
  { db: usersDB, folder: 'seeds', prefix: 'users' },
  { db: analyticsDB, folder: 'seeds', prefix: 'analytics' },
];

async function runSeeds() {
  for (const { db, folder, prefix } of seeds) {
    const folderPath = path.join(__dirname, folder);
    const files = fs
      .readdirSync(folderPath)
      .filter((file) => file.startsWith(`seed_${prefix}`))
      .sort();

    for (const file of files) {
      const filePath = path.join(folderPath, file);
      const sql = fs.readFileSync(filePath, 'utf8');
      try {
        console.log(`Running seed: ${file}`);
        await db.query(sql);
      } catch (err) {
        console.error(`Error running seed ${file}:`, err);
      }
    }
  }
  console.log('All seeds completed!');
}

runSeeds()
  .then(() => process.exit(0))
  .catch((err) => {
    console.error('Seeding error:', err);
    process.exit(1);
  });
