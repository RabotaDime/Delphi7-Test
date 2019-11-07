SELECT * FROM Customer;

/* 
-- SELECT * FROM Customer                        -- вывод всей таблицы
-- SELECT * FROM Customer WHERE Country = "US"   -- вывести только записи у которых страна = US
-- SELECT * FROM Customer WHERE Country = 'US' OR Country = 'Canada'
-- SELECT * FROM Customer WHERE Country IN ('US', 'Canada', 'Fiji')
-- SELECT DISTINCT Country FROM Customer         -- уникальный набор стран (Country)
-- SELECT DISTINCT Country,State FROM Customer   -- уникальный набор пар (Country <-> State)

SELECT * FROM Customer WHERE Country IN ('US', 'Canada', 'Fiji');


SELECT * FROM Customer WHERE Company LIKE 'Ca%';
SELECT * FROM Customer WHERE Company LIKE '%ss%';


SELECT * FROM Customer WHERE CustNo BETWEEN 2000 and 3000;


SELECT Country,City FROM Customer ORDER BY Country DESC, City;


SELECT Count(CustNo) FROM Customer;
SELECT Count(*) FROM Customer;


SELECT Count(*),Country FROM Customer GROUP BY Country;
SELECT Count(*),Country,State FROM Customer GROUP BY Country,State;
*/



