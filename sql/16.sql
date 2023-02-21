/*
 * Use a JOIN to order the films by most profitable,
 * where the profit is the total amount that customer have payer for the film.
 * Use tables payment, rental, inventory, and film. 
 */

SELECT f.title, sum(p.amount) AS profit FROM film AS f 
INNER JOIN inventory AS i ON f.film_id = i.film_id 
INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
INNER JOIN payment AS p ON r.rental_id = p.rental_id
GROUP BY f.title ORDER BY sum(p.amount) DESC;
