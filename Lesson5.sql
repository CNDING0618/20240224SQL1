/*field constraints*/
/*
PRIMARY KEY {}
NOT NULL	不容許空白
UNIQUE		不容許重複
DEFAULT 	新增值時可以不設定
*/

DROP TABLE student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	major VARCHAR(20) UNIQUE
);

SELECT *
FROM student