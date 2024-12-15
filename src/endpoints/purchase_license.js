const { usersDB } = require("../connectionStrings");

module.exports = async (req, res) => {
  try {
    const { school_id, course_id, license_start_date, license_end_date } =
      req.body;
    await usersDB.query(
      `INSERT INTO school_licenses (school_id, course_id, license_start_date, license_end_date) 
       VALUES ($1, $2, $3, $4);`,
      [school_id, course_id, license_start_date, license_end_date]
    );
    res.status(201).send("License purchased successfully");
  } catch (err) {
    console.error(err);
    res.status(500).send("Error purchasing license");
  }
};
