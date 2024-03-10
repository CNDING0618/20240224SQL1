SELECT * FROM stations;
SELECT * FROM gate_count;
SELECT date_part('month',日期) FROM gate_count;

/*全省各站點2022年進站總人數*/
SELECT 名稱 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	GROUP BY 名稱;

/*全省各站點2022年進站總人數大於5佰萬人的站點*/
SELECT 名稱 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	GROUP BY 名稱 HAVING SUM(進站人數) >= 5000000;
	
/*基隆火車站2020年,每月份進站人數*/
SELECT date_part('month',日期) AS 月份 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	WHERE 名稱 = '基隆'
	GROUP BY 月份 ;

/*基隆火車站2020年,每月份進站人數,由多至少*/
SELECT date_part('month',日期) AS 月份 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	WHERE 名稱 = '基隆'
	GROUP BY 月份 ORDER BY 進站總人數 DESC;
	
/*基隆火車站2020,2021,2022,每年進站人數*/
SELECT date_part('year',日期) AS 年度 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	WHERE 名稱 = '基隆'
	GROUP BY 年度;

/*基隆火車站,臺北火車站2020,2021,2022,每年進站人數*/
SELECT 名稱||date_part('year',日期) AS 站別年度 , SUM(進站人數) AS 進站總人數 
	FROM gate_count LEFT JOIN stations ON 站點編號=編號
	WHERE 名稱 = '基隆' OR 名稱='臺北'
	GROUP BY 站別年度
	ORDER BY 站別年度;