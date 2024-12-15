const express = require("express");
const path = require("path");
const routes = require("./routes");
require("dotenv").config(); // Load environment variables from .env

const app = express();

// Set EJS as the view engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Serve static files (if needed for styles or scripts)
app.use(express.static(path.join(__dirname, "..", "public")));

app.get("/", async (req, res) => {
  res.render("endpoints", { routes });
});

// Initialize the routes
Object.entries(routes).forEach(([path, option]) => {
  app[option.method](path, option.handler);
});

// Start the server using the PORT variable
const PORT = process.env.PORT || 3000;
app.listen(PORT, () =>
  console.log(`Server running on http://localhost:${PORT}`)
);
