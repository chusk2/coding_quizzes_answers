# Quiz posted on link:
# https://twitter.com/thesql_tribe/status/1732459043992612935/photo/1

# DATABASE CREATION
create if not exists database marks ;
use marks ;

# TABLES CREATION AND INSERT DATA INTO TABLES
create table students (
	student_id smallint auto_increment,
    first_name varchar(256),
    last_name varchar(256),
    age smallint unsigned,
    GPA decimal (2,1),
    primary key (student_id)
    ) ;

insert into students (first_name, last_name, age, GPA) values
('Alice', 'Johson', 20, 3.5),
('Bob', 'Smith', 22, 3.8),
('Carol', 'Brown', 21, 3.2),
('David', 'Lee', 23, 3.9),
('Eve', 'Davis', 20, 3.4) ;
	
create table courses (
	course_id smallint,
    course_name varchar(256),
    credits smallint,
    primary key (course_id)
	) ;

insert into courses values
(101, 'Math', 3),
(102, 'English', 4),
(103, 'History', 3),
(104, 'Chemistry', 4),
(105, 'Computer Science', 3) ;

create table enrollments (
	enrollment_id smallint unsigned auto_increment,
    student_id smallint not null,
    course_id smallint,
    semester varchar(256),
    primary key (enrollment_id),
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
    ) ;

insert into enrollments (student_id, course_id, semester) values 
(1, 101, 'Fall 2022'),
(2, 102, 'Fall 2022'),
(3, 103, 'Fall 2022'),
(1, 104, 'Spring 2023'),
(2, 105, 'Spring 2023') ;

# GET THE STUDENTS WITH THE MAXIMUM GPA SCORES BY COURSE
select
	concat(s.first_name, ' ', s.last_name) as student,
    e.course_id as course_id,
    e.semester as semester,
    max(GPA) as maximum_GPA_score
from students s
join enrollments e using (student_id)
join courses c using (course_id)
group by student, course_id, semester
order by course_id ;