CREATE DATABASE MOVIE

CREATE TABLE Movies (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    ReleaseDate DATE NOT NULL,
    IMDB FLOAT NOT NULL
);

CREATE TABLE Actors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Surname NVARCHAR(255) NOT NULL
);


CREATE TABLE Genres (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL
);


CREATE TABLE MovieActors (
    MovieId INT NOT NULL,
    ActorId INT NOT NULL,
    PRIMARY KEY (MovieId, ActorId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (ActorId) REFERENCES Actors(Id)
);


CREATE TABLE MovieGenres (
    MovieId INT NOT NULL,
    GenreId INT NOT NULL,
    PRIMARY KEY (MovieId, GenreId),
    FOREIGN KEY (MovieId) REFERENCES Movies(Id),
    FOREIGN KEY (GenreId) REFERENCES Genres(Id)
);


INSERT INTO Movies (Name, ReleaseDate, IMDB)
VALUES
('Inception', '2010-07-16', 8.8),
('The Dark Knight', '2008-07-18', 9.0),
('Interstellar', '2014-11-07', 8.6),
('The Prestige', '2006-10-20', 8.5),
('Dunkirk', '2017-07-21', 7.9),
('Tenet', '2020-09-03', 7.4),
('Memento', '2000-09-05', 8.4),
('The Matrix', '1999-03-31', 8.7),
('John Wick', '2014-10-24', 7.4),
('John Wick: Chapter 2', '2017-02-10', 7.5);


INSERT INTO Actors (Name, Surname)
VALUES
('Leonardo', 'DiCaprio'),
('Christian', 'Bale'),
('Matthew', 'McConaughey'),
('Hugh', 'Jackman'),
('Tom', 'Hardy'),
('Keanu', 'Reeves'),
('Carrie-Anne', 'Moss'),
('Laurence', 'Fishburne'),
('Michael', 'Caine'),
('Joseph', 'Gordon-Levitt');


INSERT INTO Genres (Name)
VALUES
('Action'),
('Drama'),
('Sci-Fi'),
('Thriller');


INSERT INTO MovieActors (MovieId, ActorId)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 5),
(7, 1),
(8, 6),
(8, 7),
(8, 8),
(9, 6),
(10, 6);


INSERT INTO MovieGenres (MovieId, GenreId)
VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 4),
(3, 2),
(3, 3),
(4, 2),
(4, 4),
(5, 1),
(5, 2),
(6, 1),
(6, 4),
(7, 2),
(7, 4),
(8, 1),
(8, 3),
(9, 1),
(10, 1);



SELECT TOP 10 A.Name, A.Surname, COUNT(MA.MovieId) AS RoleCount
FROM Actors A
JOIN MovieActors MA ON A.Id = MA.ActorId
GROUP BY A.Name, A.Surname
ORDER BY RoleCount DESC;

SELECT G.Name AS GenreName, COUNT(MG.MovieId) AS MovieCount
FROM Genres G
JOIN MovieGenres MG ON G.Id = MG.GenreId
GROUP BY G.Name;

SELECT Name, ReleaseDate
FROM Movies
WHERE ReleaseDate > GETDATE()
ORDER BY ReleaseDate;


SELECT AVG(IMDB) AS AverageIMDB
FROM Movies
WHERE ReleaseDate >= DATEADD(YEAR, -5, GETDATE());


SELECT A.Name, A.Surname, COUNT(MA.MovieId) AS MovieCount
FROM Actors A
JOIN MovieActors MA ON A.Id = MA.ActorId
GROUP BY A.Name, A.Surname
HAVING COUNT(MA.MovieId) > 1
ORDER BY MovieCount DESC;


