TRUNCATE assessment_results, certificate, course_progress, feedback, user_activity RESTART IDENTITY CASCADE;

-- Seed assessment_results table
INSERT INTO assessment_results (user_id, course_id, assessment_score, assessment_date)
VALUES
  (1, 1, 85, '2024-01-10'),
  (2, 2, 90, '2024-01-15'),
  (3, 3, 78, '2024-01-20'),
  (4, 4, 92, '2024-02-01'),
  (5, 5, 88, '2024-02-10');

-- Seed certificate table
INSERT INTO certificate (user_id, course_id, certificate_number, issued_date)
VALUES
  (1, 1, 'CERT001', '2024-01-20'),
  (2, 2, 'CERT002', '2024-01-25'),
  (3, 3, 'CERT003', '2024-01-30'),
  (4, 4, 'CERT004', '2024-02-05'),
  (5, 5, 'CERT005', '2024-02-15');

-- Seed course_progress table
INSERT INTO course_progress (user_id, course_id, progress_percentage, status, last_updated)
VALUES
  (1, 1, 80, 'In Progress', '2024-01-15'),
  (2, 2, 95, 'Completed', '2024-01-20'),
  (3, 3, 70, 'In Progress', '2024-01-25'),
  (4, 4, 85, 'Completed', '2024-02-05'),
  (5, 5, 90, 'In Progress', '2024-02-10');

-- Seed feedback table
INSERT INTO feedback (user_id, course_id, feedback_text, rating, submitted_at)
VALUES
  (1, 1, 'Great course! Very informative.', 4, '2024-01-20'),
  (2, 2, 'Excellent explanations and examples.', 5, '2024-01-25'),
  (3, 3, 'The content was good but could use more examples.', 3, '2024-01-30'),
  (4, 4, 'Well structured and very helpful for my studies.', 4, '2024-02-05'),
  (5, 5, 'Really enjoyed this course! A must for anyone interested in ML.', 5, '2024-02-15');

-- Seed user_activity table
INSERT INTO user_activity (user_id, activity_type, activity_timestamp)
VALUES
  (1, 'Login', '2024-01-01 09:00:00'),
  (2, 'Viewed Video', '2024-01-05 11:15:00'),
  (3, 'Completed Quiz', '2024-01-10 14:30:00'),
  (4, 'Completed Assignment', '2024-02-01 16:00:00'),
  (5, 'Submitted Feedback', '2024-02-05 18:30:00');
