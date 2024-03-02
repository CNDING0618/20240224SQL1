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

INSERT INTO student VALUES (1,'小白','英語')

INSERT INTO student VALUES (2,'小黑','法語')
RETURNING *;

INSERT INTO student(name,major) VALUES('小灰','歷史')
RETURNING *;

/*v新增多筆*/
INSERT INTO student VALUES (3,'小3','英語3'),(4,'小4','英語4'),(5,'小5','英語5'),(6,'小6','英語6'),(7,'小7','英語7')
