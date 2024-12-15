-- Create the lecturers table
CREATE TABLE IF NOT EXISTS lecturers (
  lecturer_id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  expertise VARCHAR(255),
  university_id INT NOT NULL
);

-- Create the courses table
CREATE TABLE IF NOT EXISTS courses (
  course_id SERIAL PRIMARY KEY,
  course_name VARCHAR(255) NOT NULL,
  lecturer_id INT NOT NULL,
  course_description TEXT--,
  -- FOREIGN KEY (lecturer_id) REFERENCES lecturers(lecturer_id)
);

-- Create the video table
CREATE TABLE IF NOT EXISTS video (
  video_id SERIAL PRIMARY KEY,
  course_id INT NOT NULL,
  video_title VARCHAR(255) NOT NULL,
  video_description TEXT,
  upload_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  video_access VARCHAR(50) NOT NULL--, -- Could be 'public' or 'restricted'
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
);


-- Create the course_video table
CREATE TABLE IF NOT EXISTS course_video (
  course_video_id SERIAL PRIMARY KEY,
  course_id INT NOT NULL,
  video_id INT NOT NULL--,
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id),
  -- FOREIGN KEY (video_id) REFERENCES video(video_id)
);


-- Create the video_comment table
CREATE TABLE IF NOT EXISTS video_comment (
  comment_id SERIAL PRIMARY KEY,
  video_id INT NOT NULL,
  comment_text TEXT NOT NULL,
  comment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP--,
  -- FOREIGN KEY (video_id) REFERENCES video(video_id)
);

-- Partition the lecturers table by university_id
-- The partitioning method assumes your database supports partitioning. You might need to adjust based on your PostgreSQL version.
-- This example assumes you're using PostgreSQL 10 or later with range partitioning.

-- Example of partitioning the lecturers table by university_id
--CREATE TABLE IF NOT EXISTS lecturers_1 PARTITION OF lecturers FOR VALUES IN (1);
--CREATE TABLE IF NOT EXISTS lecturers_2 PARTITION OF lecturers FOR VALUES IN (2);
-- You can add more partitions for other university_id values as needed.
