select 
	p.id,
	p.first_name,
	p.last_name,
	SUM(m.budget) as total_movie_budget
from 
	Person p
join 
	Character c on p.id = c.person_id
join
	Movie m on c.movie_id = m.id
group by 
	p.id, p.first_name, p.last_name;