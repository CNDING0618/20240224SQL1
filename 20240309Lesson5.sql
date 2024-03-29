DROP TABLE IF EXISTS gate_count;
DROP TABLE IF EXISTS stations;


CREATE TABLE IF NOT EXISTS stations(
	編號 INT PRIMARY KEY,
	名稱 VARCHAR(20) NOT NULL,
	英文名稱 VARCHAR(50),
	地名 VARCHAR(20),
	英文地名 VARCHAR(50),
	地址 VARCHAR(255),
	英文地址 VARCHAR(255),
	電話 VARCHAR(20),
	gps VARCHAR(50),
	youbike BOOL
);

/*資料檢核1*/
SELECT * FROM stations;

SELECT COUNT(*) AS 筆數
FROM stations;


CREATE TABLE IF NOT EXISTS gate_count(
	id SERIAL,
	日期 DATE NOT NULL,
	站點編號 INT,
	進站人數 INT DEFAULT 0,
	出站人數 INT DEFAULT 0,
	PRIMARY KEY(id),
	FOREIGN KEY(站點編號) REFERENCES stations(編號)
	ON DELETE SET NULL
	ON UPDATE CASCADE
);

/*資料檢核2*/
SELECT * FROM gate_count;

SELECT COUNT(*) AS 筆數
FROM gate_count;

/*資料分析*/
SELECT *
FROM gate_count LEFT JOIN stations ON 站點編號=編號;

SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
FROM gate_count LEFT JOIN stations ON 站點編號=編號;

	/*取出基隆市有哪些火車站*/
	SELECT DISTINCT 名稱
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
		WHERE 地址 LIKE '基隆市%';
		
	/*取出基隆火車站2022年3月1日資料,'2022-03-01'*/
	SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
		FROM gate_count LEFT JOIN stations ON 站點編號=編號
		WHERE 名稱 = '基隆' AND 日期 = '2022-03-01';
		
	/*取出基隆火車站2022年3月份資料，時間由小到大*/
	SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
		FROM gate_count LEFT JOIN stations ON 站點編號=編號
		WHERE 名稱 = '基隆' AND (日期 BETWEEN('2022-03-01')AND('2022-03-31'))
		ORDER BY 日期 ASC;
		
	/*取出基隆火車站和台北火車站2022年3月份資料，時間由小到大*/
	SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
		FROM gate_count LEFT JOIN stations ON 站點編號=編號
		WHERE 名稱 IN('基隆','台北') AND (日期 BETWEEN('2022-03-01')AND('2022-03-31'))
		ORDER BY 日期 ASC;
	
	/*取出資料進站人數最多的前10筆資料*/
	SELECT 日期,進站人數,出站人數,名稱,地名,地址,youbike
		FROM gate_count LEFT JOIN stations ON 站點編號=編號
		ORDER BY 進站人數 DESC LIMIT 10;
