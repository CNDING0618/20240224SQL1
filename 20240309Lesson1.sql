DROP TABLE IF EXISTS 客戶;

CREATE TABLE IF NOT EXISTS 客戶(
	客戶_ID SERIAL,
	客戶名稱 VARCHAR(255) not null,
	PRIMARY KEY(客戶_ID)
);

CREATE TABLE IF NOT EXISTS 聯絡人(
	聯絡人_ID SERIAL,
	客戶_ID INT,
	聯絡人姓名  VARCHAR(255) not null,
	電話 VARCHAR(15),
	郵件 VARCHAR(100),
	PRIMARY KEY(聯絡人_ID),
	FOREIGN KEY(客戶_ID) REFERENCES 客戶(客戶_ID)
		ON DELETE SET CASCADE
);

INSERT INTO 客戶(客戶名稱) 
VALUES  ('遠傳電信'),
		('台灣大車隊'),
		('中華電信');
			
INSERT INTO 聯絡人(客戶_ID,聯絡人姓名,電話,郵件)
VALUES	(1,'001','0200000001','01@01'),
		(2,'002','0200000002','02@02'),
		(3,'003','0200000003','03@03');

DELETE FROM 客戶 WHERE 客戶_ID = 1

DROP TABLE IF EXISTS 聯絡人;
DROP TABLE IF EXISTS 客戶;