
SELECT DISTINCT artist FROM albums;
USE albums_db;
SELECT * FROM albums;
SELECT COUNT(DISTINCT artist) FROM albums;
DESCRIBE albums;
SELECT name FROM albums WHERE artist='Pink Floyd';
SELECT release_date FROM albums WHERE name='Sgt. Pepper\'s Lonely Hearts Club Band';
SELECT genre FROM albums WHERE name='Nevermind';
SELECT name FROM albums WHERE release_date BETWEEN 1990 AND 1999;
SELECT name FROM albums WHERE sales<20.0;
SELECT name FROM albums WHERE genre = 'Rock';


