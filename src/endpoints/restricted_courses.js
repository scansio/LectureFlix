const { coursesDB } = require("../connectionStrings");

module.exports = async (req, res) => {
  try {
    const { school_id } = req.query; // Assume the school ID is passed as a query parameter
    if (!school_id) {
      return res.status(400).send("Please provide school id as query parameter");
    }
    const result = await coursesDB.query(
      `SELECT c.course_name, v.video_title, v.video_access 
       FROM courses c 
       JOIN video v ON c.course_id = v.course_id 
       WHERE v.video_access = 'restricted' AND c.school_id = $1;`,
      [school_id]
    );
    res.render("restricted-courses", { courses: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error fetching restricted courses");
  }
};
