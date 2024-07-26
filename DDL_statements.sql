create table Files (
    file_name VARCHAR(100), 
    mime_type VARCHAR(100), 
    key SERIAL primary key, 
    file_URL text not null, 
    isPublic Boolean default FALSE
);

create table Users (
    id SERIAL primary key,
    username VARCHAR(50) UNIQUE NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) UNIQUE NOT NULL,
    avatar text not null
);

create table Country (
id serial primary key,
country VARCHAR(100)
);

create table Person (
    id SERIAL primary key,
    first_name VARCHAR(100) not null, 
    last_name VARCHAR(100) not null,
    biography text,
    date_of_birth Date,
    gender VARCHAR(100)
);

create table Director (
    id serial primary key,
    first_name VARCHAR(100) not null,
    last_name VARCHAR(100) not null
);

create table Genres (
    id SERIAL primary key, 
    genre_name VARCHAR(50) unique not NULL
);

create table Movie (
    id SERIAL primary key,
    title VARCHAR(50) not NULL, 
    description text, 
    budget numeric, 
    release_date DATE, 
    duration interval, 
    director INT references Director(id), 
    production_country INT references Country(id), 
    poster text, genre VARCHAR(50), 
    characters VARCHAR(200)
);

create table Character (
    id SERIAL primary key, 
    name VARCHAR(200) not null, 
    description text, 
    role VARCHAR(50) check(role in ('leading', 'supporting', 'background')), 
    person_id INT references Person(id),
    person VARCHAR(200),
    movie_id INT references Movie(id),
    constraint chk_person check (
        (person_id is not null and person is null) or 
        (person_id is null and person is not null)
));

create table MovieGenres (
    movie_id INT references Movie(id), 
    genre_id INT references Genres(id)
);

create table MovieCharacters (
    movie_id INT references Movie(id),
    character_id INT references Character(id)
);

create table Favorite_movies (
    user_id INT references Users(id),
    movie_id INT references Movie(id)
);

insert into Files (file_name, mime_type, file_URL, isPublic) VALUES
    ('example.jpg', 'image/jpeg', 'https://example-bucket.s3.amazonaws.com/example.jpg', TRUE),
    ('document.pdf', 'application/pdf', 'https://example-bucket.s3.amazonaws.com/document.pdf', FALSE);

insert into Users (username, first_name, last_name, email, password, avatar) values
    ('garet', 'Hary', 'Mckinley', 'mcgaret@gmail.com', 'dWfit492!k*', '/desctop/avatar/avatar.jpg'),
    ('miha', 'Mihaylo', 'Gora', 'mihagora@hotmail.com', '19rjEnJ80+', '/desctop/avatar/avatar.jpg');


insert into Person (first_name, last_name, biography, date_of_birth, gender) values
    ('Brad', 'Pit', 'Talanted actor, was born in USA, played various characters', '1967-10-12', 'male'),
    ('Anjelina', 'Jol', 'Talanted actress, was born in USA, played various characters', '1972-10-12', 'female');

insert into Country (country) values
    ('USA'),
    ('UK'),
    ('Grece'),
    ('Japan');

insert into Director (first_name, last_name) values
    ('Christopher', 'Nolan'),
    ('Wolfgang', 'Petersen'),
    ('Simon', 'West'),
    ('Guy', 'Ritchie'),
    ('David', 'Leitch'),
    ('Kelsey', 'Mann');


insert into Movie (title, description, budget, release_date, duration, director, production_country, poster, "characters") values
    ('Inception', 'Movie about dream in dream', 100000000, '2015-09-08', '2 hours 10 minutes', 1, 1, '/desctop/avatar/avatar.jpg', 'Cobb, Robert Fisher, Mel, Arthur'),
    ('Troy', 'Story about troy war', 90000123, '2005-03-22', '1 hour 50 minutes', 2, 3, '/desctop/avatar/avatar.jpg', 'Achilles, Hector, Menelay, Priam'),
    ('Lara Croft', 'Action movie about tomb rider Lara Croft', 35333000, '2001-11-11', '1 hour 45 minutes', 3, 1, '/desctop/avatar/avatar.jpg', 'Lara Croft'),
    ('Snatch', 'Movie about English bandits', 20000000, '2000-09-08', '1 hours 35 minutes', 4, 2, '/desctop/avatar/avatar.jpg', 'Micky, Turkish, Brick'),
    ('Bullet Train', 'Movie about assasins on the train', 150000000, '2022-08-05', '1 hour 32 minutes', 5, 4, '/desctop/avatar/avatar.jpg', 'Ladybug'),
    ('Oppenheimer', 'Movie about inventing of nuclear bomb', 100000000, '2023-05-08', '3 hours 10 minutes', 1, 1, '/desctop/avatar/avatar.jpg', 'Robert Oppenheimer'),
    ('Inside Out 2', 'Movie about amotions', 200000000, '2024-06-10', '2 hours 30 minutes', 6, 1, '/desctop/avatar/avatar.jpg', 'Anxiety, Fear');


insert into Character (name, description, role, person, movie_id) values
    ('Cobb', 'Main character of movie Inception', 'leading', 'Leonardo Di Caprio', 1);

insert into Character (name, description, role, person_id, movie_id) values 
    ('Achilles', 'Main character of movie Troy', 'leading', 1, 2),
    ('Lara Croft', 'Main character of movie Lara Croft', 'leading', 2, 3),
    ('Micky', 'Gipsi king', 'leading', 1, 4),
    ('Ladybug', 'On of the killers', 'leading', 1, 5);

insert into Genres (genre_name) values
    ('Action'), ('Drama'), ('Comedy'), ('Horor');

insert into Moviegenres (movie_id, genre_id) values
    (1, 1),
    (1, 2),
    (2, 2),
    (3, 1),
    (3, 3),
    (5, 1),
    (5, 3),
    (6, 3),
    (6, 1);

insert into MovieCharacters (movie_id, character_id) values
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

insert into Favorite_movies (user_id, movie_id) values
    (1, 1),
    (1, 2),
    (1, 3),
    (1, 6),
    (2, 1),
    (2, 3),
    (2, 4);
