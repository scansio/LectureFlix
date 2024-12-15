const { coursesDB } = require("../connectionStrings");

module.exports = async (req, res) => {
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
  }