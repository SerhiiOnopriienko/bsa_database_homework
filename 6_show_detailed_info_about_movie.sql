WITH MovieDetails AS (
    SELECT
        m.id AS movie_id,
        m.title,
        m.release_date,
        m.duration,
        m.description,
        json_build_object(
            'poster', m.poster
        ) AS poster,
        json_build_object(
            'id', d.id,
            'first_name', d.first_name,
            'last_name', d.last_name
        ) AS director,
        ARRAY(
            SELECT json_build_object(
                'id', p.id,
                'first_name', p.first_name,
                'last_name', p.last_name
            )
            FROM Person p
            JOIN Character ch ON ch.person_id = p.id
            WHERE ch.movie_id = m.id
        ) AS actors,
        ARRAY(
            SELECT json_build_object(
                'id', g.id,
                'name', g.genre_name
            )
            FROM Genres g
            JOIN MovieGenres mg ON mg.genre_id = g.id
            WHERE mg.movie_id = m.id
        ) AS genres
    FROM
        Movie m
    JOIN
        Director d ON m.director = d.id
    WHERE
        m.id = 1
)
SELECT * FROM MovieDetails;
