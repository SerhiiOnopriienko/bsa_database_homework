SELECT 
    m.id,
    m.title,
    COUNT(ch.id) AS actors_count
FROM 
    Movie m
LEFT JOIN 
    Character ch ON m.id = ch.movie_id
LEFT JOIN 
    Person p ON ch.person_id = p.id
WHERE 
    m.release_date >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY
    m.id, m.title
ORDER BY
    m.id;
