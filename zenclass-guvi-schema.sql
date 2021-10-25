create schema zenclass_guvi;
use zenclass_guvi;

-- create mentor table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`MENTORS` (
  `mentor_id` INT NOT NULL AUTO_INCREMENT,
  `mentor_name` VARCHAR(45) NOT NULL,
  `mentor_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`mentor_id`))
ENGINE = InnoDB;


-- create user table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`USERS` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `gender` VARCHAR(45) NOT NULL,
  `dob` DATE NOT NULL,
  `mentor_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `user_mentor_idx` (`mentor_id` ASC) VISIBLE,
  CONSTRAINT `user_mentor`
    FOREIGN KEY (`mentor_id`)
    REFERENCES `zenclass_guvi`.`MENTORS` (`mentor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create courses table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`COURSES` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `course_name` VARCHAR(100) NOT NULL,
  `completion_time(hrs)` INT NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;

ALTER TABLE `zenclass_guvi`.`courses` 
CHANGE COLUMN `completion_time(hrs)` `completion_time_hrs` INT NOT NULL ;


-- create topics table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`TOPICS` (
  `topic_id` INT NOT NULL AUTO_INCREMENT,
  `topics_covered` VARCHAR(45) NOT NULL,
  `session_date` DATE NOT NULL,
  `session_start_time` VARCHAR(20) NULL,
  `session_end_time` VARCHAR(20) NULL,
  PRIMARY KEY (`topic_id`))
ENGINE = InnoDB
COMMENT = '	';

-- create attendance table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`ATTENDANCE` (
  `user_id` INT NOT NULL,
  `session_id` INT NOT NULL,
  `attended` VARCHAR(10) NULL DEFAULT 'no',
  INDEX `user-attendance_idx` (`user_id` ASC) VISIBLE,
  INDEX `session_idx` (`session_id` ASC) VISIBLE,
  CONSTRAINT `user-attendance`
    FOREIGN KEY (`user_id`)
    REFERENCES `zenclass_guvi`.`USERS` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `session`
    FOREIGN KEY (`session_id`)
    REFERENCES `zenclass_guvi`.`TOPICS` (`topic_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create codekata table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`CODEKATA` (
  `user_id` INT NOT NULL,
  `problem_id` INT NOT NULL,
  `problem_statement` VARCHAR(45) NOT NULL,
  `solved_on` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  INDEX `user-problems_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user-problems`
    FOREIGN KEY (`user_id`)
    REFERENCES `zenclass_guvi`.`USERS` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create company_drives table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`COMPANY_DRIVES` (
  `user_id` INT NOT NULL,
  `company_id` INT NOT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `drive_date` DATETIME NOT NULL,
  `selection_status` VARCHAR(45) NOT NULL DEFAULT 'not selected',
  INDEX `user-company_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user-company`
    FOREIGN KEY (`user_id`)
    REFERENCES `zenclass_guvi`.`USERS` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create tasks table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`TASKS` (
  `user_id` INT NOT NULL,
  `task_id` INT NOT NULL,
  `submitted_on` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `evaluation_status` VARCHAR(45) NULL DEFAULT 'not evaluated',
  INDEX `user-tasks_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user-tasks`
    FOREIGN KEY (`user_id`)
    REFERENCES `zenclass_guvi`.`USERS` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- create student_activated_courses table
CREATE TABLE IF NOT EXISTS `zenclass_guvi`.`STUDENT_ACTIVATED_COURSES` (
  `user_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `activated_on` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `completion_status` VARCHAR(20) NULL DEFAULT 'no',
  INDEX `user-course_idx` (`user_id` ASC) VISIBLE,
  INDEX `course-activated_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `user-course`
    FOREIGN KEY (`user_id`)
    REFERENCES `zenclass_guvi`.`USERS` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `course-activated`
    FOREIGN KEY (`course_id`)
    REFERENCES `zenclass_guvi`.`COURSES` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- Inserting values into mentor table
insert into mentors(mentor_name, mentor_email) values('guvi1','guvi1@guvi.com');
insert into mentors(mentor_name, mentor_email) values('guvi2','guvi2@guvi.com');
insert into mentors(mentor_name, mentor_email) values('guvi3','guvi3@guvi.com');
insert into mentors(mentor_name, mentor_email) values('guvi4','guvi4@guvi.com');
insert into mentors(mentor_name, mentor_email) values('guvi5','guvi5@guvi.com');

-- Inserting values into courses table
insert into courses(course_name, completion_time_hrs) values('javascript',6);
insert into courses(course_name, completion_time_hrs) values('html',2);
insert into courses(course_name, completion_time_hrs) values('css',3);
insert into courses(course_name, completion_time_hrs) values('java',8);
insert into courses(course_name, completion_time_hrs) values('c++',10);

-- Inserting values into topics table
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('DOM','2021-09-11','11:00 AM','01:00 PM');
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('Promises','2021-09-12','11:00 AM','01:00 PM');
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('Asyn Await','2021-09-18','11:00 AM','01:00 PM');
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('React Basics','2021-09-19','11:00 AM','01:00 PM');
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('React Hooks','2021-09-25','11:00 AM','01:00 PM');
insert into topics(topics_covered, session_date, session_start_time, session_end_time) values('React Context API','2021-09-26','11:00 AM','01:00 PM');

-- Inserting values into users table
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('rohit@gmail.com','rohit123','pass@123','Rohit','Guvi','Male','1998-10-22',1);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('mohit@gmail.com','mohit123','pass@123','Mohit','Guvi','Male','1998-09-22',2);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('ronit@gmail.com','ronit123','pass@123','Ronit','Guvi','Male','1998-08-22',4);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('jaadu@gmail.com','jaadu123','pass@123','Jaadu','Guvi','Male','1998-01-12',1);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('surbhi@gmail.com','surbhi123','pass@123','Surbhi','Guvi','Female','1998-10-21',1);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('rachit@gmail.com','rachit123','pass@123','Rachit','Guvi','Male','1998-02-22',3);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('faisal@gmail.com','faisal123','pass@123','Faisal','Guvi','Male','1998-10-22',2);
insert into users(email, username, password, first_name, last_name, gender, dob, mentor_id) values ('nikhil@gmail.com','nikhil123','pass@123','Nikhil','Guvi','Male','1998-03-22',3);

-- Inserting values into tasks table
insert into tasks(user_id, task_id, evaluation_status) values(1, 1, 'evaluated');
insert into tasks(user_id, task_id) values(1, 2);
insert into tasks(user_id, task_id, evaluation_status) values(2, 1, 'evaluated');
insert into tasks(user_id, task_id) values(3, 2);
insert into tasks(user_id, task_id, evaluation_status) values(3, 1, 'evaluated');
insert into tasks(user_id, task_id) values(4, 1);
insert into tasks(user_id, task_id, evaluation_status) values(5, 1, 'evaluated');
insert into tasks(user_id, task_id) values(5, 2);
insert into tasks(user_id, task_id, evaluation_status) values(6, 1, 'evaluated');

-- Inserting data into company_drives table
insert into company_drives(user_id, company_id, company_name, drive_date, selection_status) values(1, 1, 'Amazon', '2021-10-23', 'selected');
insert into company_drives(user_id, company_id, company_name, drive_date) values(2, 1, 'Amazon', '2021-10-23');
insert into company_drives(user_id, company_id, company_name, drive_date, selection_status) values(2, 2, 'PayPal', '2021-10-24', 'selected');
insert into company_drives(user_id, company_id, company_name, drive_date) values(4, 1, 'Amazon', '2021-10-23');
insert into company_drives(user_id, company_id, company_name, drive_date, selection_status) values(3, 1, 'Amazon', '2021-10-23', 'selected');
insert into company_drives(user_id, company_id, company_name, drive_date) values(4, 2, 'PayPal', '2021-10-24');
insert into company_drives(user_id, company_id, company_name, drive_date, selection_status) values(5, 1, 'Amazon', '2021-10-23', 'selected');
insert into company_drives(user_id, company_id, company_name, drive_date) values(6, 1, 'Amazon', '2021-10-23');
insert into company_drives(user_id, company_id, company_name, drive_date, selection_status) values(6, 2, 'PayPal', '2021-10-24', 'selected');
insert into company_drives(user_id, company_id, company_name, drive_date) values(7, 1, 'Amazon', '2021-10-23');

-- Insrting data into Codekata table
insert into codekata(user_id, problem_id, problem_statement) values(1,1,'pattern');
insert into codekata(user_id, problem_id, problem_statement) values(1,2,'loops');
insert into codekata(user_id, problem_id, problem_statement) values(1,3,'mathematics');
insert into codekata(user_id, problem_id, problem_statement) values(2,1,'pattern');
insert into codekata(user_id, problem_id, problem_statement) values(2,2,'loops');
insert into codekata(user_id, problem_id, problem_statement) values(3,3,'mathematics');
insert into codekata(user_id, problem_id, problem_statement) values(3,1,'pattern');
insert into codekata(user_id, problem_id, problem_statement) values(3,2,'loops');
insert into codekata(user_id, problem_id, problem_statement) values(4,3,'mathematics');
insert into codekata(user_id, problem_id, problem_statement) values(4,1,'pattern');
insert into codekata(user_id, problem_id, problem_statement) values(5,2,'loops');
insert into codekata(user_id, problem_id, problem_statement) values(6,3,'mathematics');
insert into codekata(user_id, problem_id, problem_statement) values(7,1,'pattern');
insert into codekata(user_id, problem_id, problem_statement) values(8,2,'loops');
insert into codekata(user_id, problem_id, problem_statement) values(8,3,'mathematics');

-- Inserting data into attendance table
insert into attendance(user_id, session_id, attended) values(1,1,'yes');
insert into attendance(user_id, session_id, attended) values(1,2,'yes');
insert into attendance(user_id, session_id, attended) values(1,3,'yes');
insert into attendance(user_id, session_id, attended) values(1,4,'no');
insert into attendance(user_id, session_id, attended) values(1,5,'yes');
insert into attendance(user_id, session_id, attended) values(1,6,'yes');
insert into attendance(user_id, session_id, attended) values(2,1,'no');
insert into attendance(user_id, session_id, attended) values(2,2,'yes');
insert into attendance(user_id, session_id, attended) values(2,3,'yes');
insert into attendance(user_id, session_id, attended) values(2,4,'yes');
insert into attendance(user_id, session_id, attended) values(2,5,'yes');
insert into attendance(user_id, session_id, attended) values(2,6,'yes');
insert into attendance(user_id, session_id, attended) values(3,1,'yes');
insert into attendance(user_id, session_id, attended) values(3,2,'yes');
insert into attendance(user_id, session_id, attended) values(3,3,'yes');
insert into attendance(user_id, session_id, attended) values(3,4,'yes');
insert into attendance(user_id, session_id, attended) values(3,5,'yes');
insert into attendance(user_id, session_id, attended) values(3,6,'yes');
insert into attendance(user_id, session_id, attended) values(4,1,'no');
insert into attendance(user_id, session_id, attended) values(4,2,'yes');
insert into attendance(user_id, session_id, attended) values(4,3,'yes');
insert into attendance(user_id, session_id, attended) values(4,4,'no');
insert into attendance(user_id, session_id, attended) values(4,5,'yes');
insert into attendance(user_id, session_id, attended) values(4,6,'yes');
insert into attendance(user_id, session_id, attended) values(5,1,'yes');
insert into attendance(user_id, session_id, attended) values(5,2,'yes');
insert into attendance(user_id, session_id, attended) values(5,3,'yes');
insert into attendance(user_id, session_id, attended) values(5,4,'yes');
insert into attendance(user_id, session_id, attended) values(5,5,'no');
insert into attendance(user_id, session_id, attended) values(5,6,'yes');
insert into attendance(user_id, session_id, attended) values(6,1,'no');
insert into attendance(user_id, session_id, attended) values(6,2,'yes');
insert into attendance(user_id, session_id, attended) values(6,3,'yes');
insert into attendance(user_id, session_id, attended) values(6,4,'yes');
insert into attendance(user_id, session_id, attended) values(6,5,'yes');
insert into attendance(user_id, session_id, attended) values(6,6,'no');
insert into attendance(user_id, session_id, attended) values(7,1,'yes');
insert into attendance(user_id, session_id, attended) values(7,2,'yes');
insert into attendance(user_id, session_id, attended) values(7,3,'yes');
insert into attendance(user_id, session_id, attended) values(7,4,'yes');
insert into attendance(user_id, session_id, attended) values(7,5,'yes');
insert into attendance(user_id, session_id, attended) values(7,6,'yes');
insert into attendance(user_id, session_id, attended) values(8,1,'yes');
insert into attendance(user_id, session_id, attended) values(8,2,'yes');
insert into attendance(user_id, session_id, attended) values(8,3,'np');
insert into attendance(user_id, session_id, attended) values(8,4,'no');
insert into attendance(user_id, session_id, attended) values(8,5,'yes');
insert into attendance(user_id, session_id, attended) values(8,6,'yes');

-- Inserting data into student_activate_courses table
insert into student_activated_courses(user_id, course_id, completion_status) values(1,1,'no');
insert into student_activated_courses(user_id, course_id, completion_status) values(1,4,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(2,1,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(3,2,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(5,1,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(5,4,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(5,2,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(6,2,'no');
insert into student_activated_courses(user_id, course_id, completion_status) values(6,1,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(7,4,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(7,5,'yes');
insert into student_activated_courses(user_id, course_id, completion_status) values(8,5,'yes');


-- Queries

-- get number of problems solved in codekata by the users
select u.user_id, u.email, u.username, u.first_name, count(c.problem_id) as total_problems_solved from users u, codekata c where u.user_id = c.user_id group by u.user_id;

-- display the number of company drives attended by the users
select u.user_id, u.email, u.username, u.first_name, count(c.company_id) as drives_attended from users u, company_drives c where u.user_id = c.user_id group by u.user_id;

-- combine and display students_activated_courses and courses for a specific user grouping them based on the course
select c.course_id, c.course_name, c.completion_time_hrs, count(s.user_id) as users_enrolled from courses c LEFT JOIN student_activated_courses s ON c.course_id = s.course_id group by c.course_id;

-- list all the mentors
select * from mentors;

-- list the number of students that are assigned for a mentor
select count(*) from users where mentor_id is NOT NULL;