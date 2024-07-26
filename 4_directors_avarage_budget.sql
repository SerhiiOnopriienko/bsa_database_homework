SELECT 
    m.director AS director_name,
    AVG(m.budget) AS average_budget
FROM 
    Movie m
GROUP BY 
    m.director;