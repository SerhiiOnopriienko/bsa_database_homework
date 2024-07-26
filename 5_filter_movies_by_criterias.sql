SELECT
    m.id AS movie_id,
    m.title,
    m.release_date,
    m.duration,
    m.description,
    m.poster,
    json_build_object(
        'id', d.id,
        'first_name', d.first_name,
        'last_name', d.last_name
    ) AS director
FROM
    Movie m
JOIN
    Director d ON m.director = d.id
JOIN
    MovieGenres mg ON m.id = mg.movie_id
JOIN
    Genres g ON mg.genre_id = g.id
WHERE
    m.production_country = 1
    AND m.release_date >= '2022-01-01'
    AND m.duration > INTERVAL '2 hours 15 minutes'
    AND g.genre_name IN ('Action', 'Drama')
GROUP BY
    m.id, d.id, d.first_name, d.last_name;
