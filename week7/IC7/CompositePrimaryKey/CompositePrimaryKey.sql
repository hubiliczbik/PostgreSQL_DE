create table students (
id bigint generated always as identity primary key,
name varchar(100) not null);

create table courses (
id bigint generated always as identity primary key,
name varchar(100) not null);

create table enrollments (
student_id bigint not null,
course_id bigint not null,

foreign key (student_id) references students(id),
foreign key (course_id) references courses(id),

unique (student_id, course_id)
);
