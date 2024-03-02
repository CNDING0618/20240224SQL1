DROP TABLE student;

CREATE TABLE student(
	student_id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	major VARCHAR(20),
	score INT
);

INSERT INTO student VALUES (3,'小3','英語3',30);
INSERT INTO student VALUES (4,'小4','英語4',40);
INSERT INTO student VALUES (5,'小5','英語5',50);
INSERT INTO student VALUES (6,'小6','英語6',60);
INSERT INTO student VALUES (7,'小7','英語7',70);


/*
SELECT '欄位名' FROM'表格名' 
WHERE'比較運算子'
ORDER BY ASC ^ DESC
LIMIT '筆數'*/
SELECT * from student;
SELECT name, major from student;
SELECT name AS 姓名, major AS 主修 from student;

SELECT * FROM student ORDER BY score DESC;
SELECT * FROM student ORDER BY score DESC LIMIT 3;
SELECT * FROM student ORDER BY score ASC LIMIT 2;