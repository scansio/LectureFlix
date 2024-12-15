### LectureFlix Prototype

---

#### Overview

LectureFlix is a prototype for an academic content platform designed to combine the functionalities of Netflix and YouTube. The platform restricts content uploads to lecturers, allowing them to manage public and restricted access to videos. Schools can license content for students, while general users can subscribe for public content access.

---

#### Features

- **Multi-Database Architecture:**
  - `lectureflix_courses` for course and video data.
  - `lectureflix_users` for user management and subscription data.
  - `lectureflix_analytics` for tracking progress, feedback, and user activity.

- **Partitioning:**
  - Lecturers are partitioned by `university_id`.
  - Learners are partitioned by `country`.

- **Example Queries:**
  - Select, insert, update, and delete operations, including cross-database queries.

---

#### Prototype Components

1. **Databases:**
   - Three PostgreSQL databases with five tables each, populated with sample data (20 rows per table).

2. **Backend:**
   - Built with Node.js and Express.
   - Routes for accessing and modifying data, including example API endpoints.

3. **Frontend:**
   - Simple HTML and JavaScript-based UI for interacting with backend APIs.

---

#### Setup Instructions

1. **Database Setup:**
   - Create PostgreSQL databases: `lectureflix_courses`, `lectureflix_users`, `lectureflix_analytics`.
   - Populate tables using SQL scripts or sample data provided.

2. **Backend Setup:**
   - Install dependencies:
     ```bash
     npm install express pg cors
     ```
   - Run the server:
     ```bash
     node server.js
     ```

3. **Frontend Setup:**
   - Open `index.html` in a browser.
   - Ensure the backend server is running at `http://localhost:3000`.

---

#### Example Queries

- **Fetch all public courses and videos:**
  ```sql
  SELECT c.course_name, v.video_title
  FROM lectureflix_courses.courses c
  JOIN lectureflix_courses.video v ON c.course_id = v.course_id
  WHERE v.video_access = 'public';
  ```

- **Insert a new learner:**
  ```sql
  INSERT INTO lectureflix_users.learner_user
  (learner_user_id, full_name, email, password, country, date_of_birth, registration_date)
  VALUES (101, 'Jane Doe', 'jane@example.com', 'securepassword', 'UK', '1990-01-01', CURRENT_DATE);
  ```

- **Cross-database query:**
  ```sql
  SELECT l.full_name, p.progress_percentage
  FROM lectureflix_users.learner_user l
  JOIN lectureflix_analytics.course_progress p ON l.learner_user_id = p.user_id
  WHERE p.course_id = 101;
  ```

---

#### File Structure

```
LectureFlix/
├── src/
│   ├── index.js       # Backend server code
│   ├── views/
│       ├── courses.ejs     # EJS template for courses page
├── public/
│   ├── css/
│       ├── styles.css      # Static CSS
├── package.json        # Node.js package file
```

---

#### Usage

1. Start the backend server.
2. Open the frontend in a browser.
3. Use the UI to fetch and interact with course data or run example queries directly on the databases.

--- 

#### Contribution

Feel free to fork this repository and contribute by submitting pull requests for new features or optimizations.

--- 

#### License

This project is for academic purposes only and is not intended for commercial use.