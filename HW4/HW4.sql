use classicmodels;
 -- Homework 4: INNER join orders,orderdetails,products and customers
SELECT orderNumber, orderDate, customerName, productName, quantityOrdered, priceEach
FROM
	orders
INNER JOIN orderdetails USING (orderNumber)
INNER JOIN products USING (productCode)
INNER JOIN customers USING (customerNumber)
ORDER BY orderNumber, orderLineNumber;