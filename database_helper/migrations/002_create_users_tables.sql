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

-- Create the admin_user table
CREATE TABLE IF NOT EXISTS admin_user (
  admin_user_id SERIAL PRIMARY KEY,
  full_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL
);

-- Create the payment table
CREATE TABLE IF NOT EXISTS payment (
  payment_id SERIAL PRIMARY KEY,
  learner_user_id INT NOT NULL REFERENCES learner_user(learner_user_id),
  amount DECIMAL(10, 2) NOT NULL,
  payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  payment_method VARCHAR(255) NOT NULL
);

-- Create the subscription table
CREATE TABLE IF NOT EXISTS subscription (
  subscription_id SERIAL PRIMARY KEY,
  learner_user_id INT NOT NULL REFERENCES learner_user(learner_user_id),
  subscription_type VARCHAR(255) NOT NULL,
  start_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  end_date TIMESTAMP
);

-- Create the user_log table
CREATE TABLE IF NOT EXISTS user_log (
  log_id SERIAL PRIMARY KEY,
  learner_user_id INT NOT NULL REFERENCES learner_user(learner_user_id),
  login_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  logout_time TIMESTAMP
);

-- Partition learner_user table by country
-- The partitioning method assumes your database supports partitioning. You might need to adjust based on your PostgreSQL version.
-- This example assumes you're using PostgreSQL 10 or later with range partitioning.

-- Example of partitioning the learner_user table by country
--CREATE TABLE IF NOT EXISTS learner_user_america PARTITION OF learner_user FOR VALUES IN ('USA');
--CREATE TABLE IF NOT EXISTS learner_user_uk PARTITION OF learner_user FOR VALUES IN ('UK');
--CREATE TABLE IF NOT EXISTS learner_user_canada PARTITION OF learner_user FOR VALUES IN ('Canada');
-- You can add more partitions for other countries as needed.
