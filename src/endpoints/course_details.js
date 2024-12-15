const { coursesDB } = require("../connectionStrings");

module.exports = async (req, res) => {
  try {
    const { courseId } = req.params;
    const result = await coursesDB.query(
      `SELECT c.course_name, v.video_title, v.video_access 
       FROM courses c 
       JOIN video v ON c.course_id = v.course_id 
       WHERE c.course_id = $1;`,
      [courseId]
    );

    if (result.rows.length === 0) {
      return res.status(404).send("Course not found");
    }

    res.render("course_details", { course: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).send("Error fetching course details");
  }
};
