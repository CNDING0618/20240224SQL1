SELECT *
	FROM payment

/*取出PAYMENT的所有客戶的CUSTOMER_ID(不重複)*/
SELECT customer_id, COUNT(*) AS 筆數
	FROM payment
	GROUP BY customer_id
	
/*取出PAYMENT的所有客戶的應收帳款總和，SUM()*/
SELECT customer_id, SUM(amount) AS 應收帳款
FROM payment
GROUP BY customer_id ORDER BY 應收帳款 DESC;
	
/*合併表單payment&customer*/
SELECT first_name || ' ' || last_name AS ful_name, 
	SUM(amount) AS 應收帳款
FROM payment LEFT JOIN customer ON payment.customer_id = customer.customer_id
GROUP BY ful_name ORDER BY 應收帳款 DESC;

SELECT first_name || ' ' || last_name AS ful_name, 
	SUM(amount) AS 應收帳款
FROM payment LEFT JOIN customer USING (customer_id)
GROUP BY ful_name ORDER BY 應收帳款 DESC;

SELECT first_name || ' ' || last_name AS ful_name, 
	SUM(amount) AS 應收帳款
FROM payment LEFT JOIN customer USING (customer_id)
GROUP BY ful_name HAVING SUM(amount) >= 200 ORDER BY 應收帳款 DESC;