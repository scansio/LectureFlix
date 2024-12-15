const express = require("express");
const { Pool } = require("pg");
const path = require("path");
require("dotenv").config(); // Load environment variables from .env

const app = express();

const coursesDB = new Pool({ connectionString: process.env.COURSES_DB_URL });
const usersDB = new Pool({ connectionString: process.env.USERS_DB_URL });
const analyticsDB = new Pool({
  connectionString: process.env.ANALYTICS_DB_URL,
});

// Set EJS as the view engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Serve static files (if needed for styles or scripts)
app.use(express.static(path.join(__dirname, "..", "public")));

// Route to render all public courses
app.get("/courses", async (req, res) => {
  try {
    const result = await coursesDB.query(
      `SELECT c.course_name, v.video_title, v.video_access 
       FROM courses c 
       JOIN video v ON c.course_id = v.course_id 
       WHERE v.video_access = 'public';`
    );
    res.render("courses", { courses: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error fetching courses");
  }
});

// Start the server using the PORT variable
const PORT = process.env.PORT || 3000;
app.listen(PORT, () =>
  console.log(`Server running on http://localhost:${PORT}`)
);
