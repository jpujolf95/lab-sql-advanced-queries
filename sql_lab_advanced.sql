USE Sakila;

# For each film, list actor that has acted in more films.

SELECT a.title, CONCAT(c.first_name, ' ', c.last_name) AS actor_name
FROM film a
JOIN film_actor b
ON a.film_id = b.film_id
JOIN actor c
ON b.actor_id = c.actor_id
WHERE b.actor_id = (
	SELECT d.actor_id
    FROM film_actor d
    WHERE d.film_id = a.film_id
    GROUP BY d.actor_id
    ORDER BY COUNT(*) DESC
    LIMIT 1); #error : query returns more than one row -> OK we only need 1 actor