select 
	u.id,
	u.username,
	array_agg(fm.movie_id) as favorite_movie_ids
from 
	users u
left join 
	favorite_movies fm on u.id = fm.user_id 
group by 
	u.id, u.username;
