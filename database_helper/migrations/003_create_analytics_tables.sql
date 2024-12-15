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

-- Create the learner_user table
CREATE TABLE IF NOT EXISTS learner_user (
  learner_user_id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  country VARCHAR(255),
  date_of_birth DATE,
  registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the assessment_results table
CREATE TABLE IF NOT EXISTS assessment_results (
  result_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  assessment_score DECIMAL(5, 2) NOT NULL,
  assessment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP --,
  -- FOREIGN KEY (user_id) REFERENCES learner_user(learner_user_id),
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create the certificate table
CREATE TABLE IF NOT EXISTS certificate (
  certificate_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  certificate_number VARCHAR(255) UNIQUE NOT NULL,
  issued_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP--,
  -- FOREIGN KEY (user_id) REFERENCES learner_user(learner_user_id),
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create the course_progress table
CREATE TABLE IF NOT EXISTS course_progress (
  progress_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  progress_percentage DECIMAL(5, 2) NOT NULL,
  status VARCHAR(50),
  last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP--,
  -- FOREIGN KEY (user_id) REFERENCES learner_user(learner_user_id),
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create the feedback table
CREATE TABLE IF NOT EXISTS feedback (
  feedback_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  course_id INT NOT NULL,
  feedback_text TEXT,
  rating INT CHECK (rating >= 1 AND rating <= 5),
  submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP--,
  -- FOREIGN KEY (user_id) REFERENCES learner_user(learner_user_id),
  -- FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- Create the user_activity table
CREATE TABLE IF NOT EXISTS user_activity (
  activity_id SERIAL PRIMARY KEY,
  user_id INT NOT NULL,
  activity_type VARCHAR(255) NOT NULL,
  activity_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP--,
  -- FOREIGN KEY (user_id) REFERENCES learner_user(learner_user_id)
);
