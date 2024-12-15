const courses = require("./endpoints/courses");
const course_details = require("./endpoints/course_details");
const purchase_license = require("./endpoints/purchase_license");
const restricted_courses = require("./endpoints/restricted_courses");
const subscribe = require("./endpoints/subscribe");
const upload_course = require("./endpoints/upload_course");

module.exports = {
  "/courses": {
    handler: courses,
    method: "get",
    description: "Route to render all public courses",
  },

  "/restricted-courses": {
    handler: restricted_courses,
    method: "get",
    description: "Route to render restricted courses for licensed schools",
  },

  "/upload-course": {
    handler: upload_course,
    method: "post",
    description: "Route for lecturers to upload content",
  },

  "/purchase-license": {
    handler: purchase_license,
    method: "post",
    description: "Route for schools to purchase licenses",
  },

  "/subscribe": {
    handler: subscribe,
    method: "post",
    description:
      "Route for regular users to subscribe to access public content",
  },

  "/courses/:courseId": {
    handler: course_details,
    method: "get",
    description: "Route to view a specific course",
  },
};
