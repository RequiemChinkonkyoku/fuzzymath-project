use master

drop database if exists FuzzyMathDB

create database FuzzyMathDB

use FuzzyMathDB

DROP TABLE IF EXISTS userExercises;
DROP TABLE IF EXISTS options;
DROP TABLE IF EXISTS exercises;
DROP TABLE IF EXISTS userLesson;
DROP TABLE IF EXISTS lesson;
DROP TABLE IF EXISTS userCourses;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS userSubscription;
DROP TABLE IF EXISTS subscription;
DROP TABLE IF EXISTS users;

create table users
(
	userID int primary key,
	username varchar,
	password varchar,
	email varchar,
	name varchar,
	address varchar,
	phone varchar,
)

create table subscription
(
	subscriptionID int primary key,
	name varchar,
	description varchar,
	price int,
)

create table userSubscription
(
	userSubscriptionID int primary key,
	subscribedDate date,
	expireDate date,
	userID int foreign key references users(userID),
	subscriptionID int foreign key references subscription(subscriptionID)
)

create table courses
(
	courseID int primary key,
	name varchar,
	description varchar
)

create table userCourses
(
	userCoursesID int primary key,
	enrollDate date,
	completeDate date,
	userID int foreign key references users(userID),
	courseID int foreign key references courses(courseID),
)

create table lesson
(
	lessonID int primary key,
	name varchar,
	description varchar,
	createDate date,
	publishDate date,
	courseID int foreign key references courses(courseID),
)

create table userLesson
(
	userLessonID int primary key,
	completeDate date,
	status int,
	userID int foreign key references users(userID),
	lessonID int foreign key references lesson(lessonID),
)

create table exercises
(
	exerciseID int primary key,
	content varchar,
	answer varchar,
	type varchar,
	lessonID int foreign key references lesson(lessonID),
)

create table options
(
	optionID int primary key,
	content varchar,
	isCorrect int,
	exerciseID int foreign key references exercises(exerciseID),
)

create table userExercises
(
	userExerciseID int primary key,
	completed int,
	completeDate date,
	userID int foreign key references users(userID),
	exerciseID int foreign key references exercises(exerciseID),
)