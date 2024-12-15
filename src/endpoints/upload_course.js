const { coursesDB } = require("../connectionStrings");

module.exports = async (req, res) => {
  try {
    const { course_name, lecturer_id, video_title, video_access } = req.body;
    const courseResult = await coursesDB.query(
      `INSERT INTO courses (course_name, lecturer_id) 
       VALUES ($1, $2) RETURNING course_id;`,
      [course_name, lecturer_id]
    );
    const courseId = courseResult.rows[0].course_id;

    await coursesDB.query(
      `INSERT INTO video (course_id, video_title, video_access) 
       VALUES ($1, $2, $3);`,
      [courseId, video_title, video_access]
    );

    res.status(201).send("Course uploaded successfully");
  } catch (err) {
    console.error(err);
    res.status(500).send("Error uploading course");
  }
}