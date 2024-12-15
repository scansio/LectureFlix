TRUNCATE courses, lecturers, video, course_video, video_comment RESTART IDENTITY CASCADE;

-- Seed courses table
INSERT INTO courses (course_name, lecturer_id, course_description)
VALUES
  ('Introduction to Programming', 1, 'Learn the basics of programming with hands-on examples.'),
  ('Data Structures and Algorithms', 2, 'Dive into data structures and algorithms with problem-solving sessions.'),
  ('Web Development Fundamentals', 3, 'Understand the fundamentals of building modern web applications.'),
  ('Database Management Systems', 4, 'Learn about relational databases, SQL, and optimization techniques.'),
  ('Machine Learning', 5, 'Learn how to build and train machine learning models using Python.');

-- Seed lecturers table
INSERT INTO lecturers (full_name, email, expertise, university_id)
VALUES
  ('Dr. John Doe', 'john.doe@example.com', 'Computer Science', 1),
  ('Dr. Alice Brown', 'alice.brown@example.com', 'Software Engineering', 2),
  ('Dr. Mark Wilson', 'mark.wilson@example.com', 'Web Development', 1),
  ('Dr. Sarah Miller', 'sarah.miller@example.com', 'Database Systems', 3),
  ('Dr. James Clark', 'james.clark@example.com', 'Machine Learning', 2);

-- Seed video table
INSERT INTO video (course_id, video_title, video_description, video_access)
VALUES
  (1, 'Introduction to Programming - Part 1', 'Covering the basics of programming in Python', 'public'),
  (1, 'Introduction to Programming - Part 2', 'Continuing with more advanced topics in Python', 'public'),
  (2, 'Data Structures - Arrays and Lists', 'Explaining arrays and linked lists', 'restricted'),
  (3, 'Web Development - HTML and CSS', 'Building the structure and style of a webpage', 'public'),
  (4, 'SQL Basics', 'Introduction to SQL queries and database design', 'restricted');

-- Seed course_video table
INSERT INTO course_video (course_id, video_id)
VALUES
  (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);

-- Seed video_comment table
INSERT INTO video_comment (video_id, comment_text)
VALUES
  (1, 'Great introduction!'),
  (2, 'Looking forward to the next part!'),
  (3, 'Good explanation of arrays.'),
  (4, 'Nice walkthrough of HTML and CSS.'),
  (5, 'The SQL basics were clear and informative.');
