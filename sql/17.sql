/*
 * Use a JOIN to order the countries by most profitable,
 * where the profit is the total amount that all customers from that country have payed.
 * Use tables payment, rental, customer, address, city, and country.
 * Order by country alphabetically.
 */

SELECT c.country, sum(p.amount) AS profit FROM country AS c
INNER JOIN city AS ci ON c.country_id = ci.country_id
INNER JOIN address AS a ON ci.city_id = a.city_id
INNER JOIN customer AS cu ON a.address_id = cu.address_id
INNER JOIN rental as r ON cu.customer_id = r.customer_id
INNER JOIN payment as p ON r.rental_id = p.rental_id
GROUP BY country ORDER BY c.country;
