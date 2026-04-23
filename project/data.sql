DELETE FROM first_names;

INSERT INTO first_names (name, locale) VALUES
('John','en_US'),('Michael','en_US'),('David','en_US'),('James','en_US'),
('Robert','en_US'),('Daniel','en_US'),('William','en_US'),('Joseph','en_US'),
('Charles','en_US'),('Thomas','en_US'),('Christopher','en_US'),('Matthew','en_US'),
('Anthony','en_US'),('Mark','en_US'),('Paul','en_US'),('Steven','en_US'),
('Andrew','en_US'),('Joshua','en_US'),('Kevin','en_US'),('Brian','en_US'),

('Emily','en_US'),('Emma','en_US'),('Olivia','en_US'),('Sophia','en_US'),
('Ava','en_US'),('Isabella','en_US'),('Mia','en_US'),('Charlotte','en_US'),
('Amelia','en_US'),('Harper','en_US'),('Evelyn','en_US'),('Abigail','en_US'),
('Ella','en_US'),('Scarlett','en_US'),('Grace','en_US'),('Chloe','en_US'),

('Hans','de_DE'),('Peter','de_DE'),('Lukas','de_DE'),('Leon','de_DE'),
('Finn','de_DE'),('Paul','de_DE'),('Jonas','de_DE'),('Ben','de_DE'),
('Elias','de_DE'),('Noah','de_DE'),('Luis','de_DE'),('Felix','de_DE'),
('Maximilian','de_DE'),('Alexander','de_DE'),('Julian','de_DE'),('Tim','de_DE'),
('Niklas','de_DE'),('Moritz','de_DE'),('Jan','de_DE'),('Fabian','de_DE'),

('Anna','de_DE'),('Marie','de_DE'),('Laura','de_DE'),('Sophie','de_DE'),
('Mia','de_DE'),('Hannah','de_DE'),('Lea','de_DE'),('Lena','de_DE'),
('Clara','de_DE'),('Sarah','de_DE'),('Lisa','de_DE'),('Julia','de_DE'),
('Katharina','de_DE'),('Nina','de_DE'),('Vanessa','de_DE'),('Theresa','de_DE');



DELETE FROM last_names;

INSERT INTO last_names (name, locale) VALUES
('Smith','en_US'),('Johnson','en_US'),('Williams','en_US'),('Brown','en_US'),
('Jones','en_US'),('Garcia','en_US'),('Miller','en_US'),('Davis','en_US'),
('Rodriguez','en_US'),('Martinez','en_US'),('Hernandez','en_US'),('Lopez','en_US'),
('Gonzalez','en_US'),('Wilson','en_US'),('Anderson','en_US'),('Thomas','en_US'),
('Taylor','en_US'),('Moore','en_US'),('Jackson','en_US'),('Martin','en_US'),
('Lee','en_US'),('Perez','en_US'),('Thompson','en_US'),('White','en_US'),
('Harris','en_US'),('Sanchez','en_US'),('Clark','en_US'),('Ramirez','en_US'),
('Lewis','en_US'),('Robinson','en_US'),('Walker','en_US'),('Young','en_US'),
('Allen','en_US'),('King','en_US'),('Wright','en_US'),('Scott','en_US'),

('Müller','de_DE'),('Schmidt','de_DE'),('Schneider','de_DE'),('Fischer','de_DE'),
('Weber','de_DE'),('Meyer','de_DE'),('Wagner','de_DE'),('Becker','de_DE'),
('Schulz','de_DE'),('Hoffmann','de_DE'),('Schäfer','de_DE'),('Koch','de_DE'),
('Bauer','de_DE'),('Richter','de_DE'),('Klein','de_DE'),('Wolf','de_DE'),
('Schröder','de_DE'),('Neumann','de_DE'),('Schwarz','de_DE'),('Zimmermann','de_DE'),
('Braun','de_DE'),('Krüger','de_DE'),('Hartmann','de_DE'),('Lange','de_DE'),
('Schmitt','de_DE'),('Werner','de_DE'),('Krause','de_DE'),('Meier','de_DE'),
('Lehmann','de_DE'),('Köhler','de_DE'),('Herrmann','de_DE'),('König','de_DE');
DELETE FROM cities;

INSERT INTO cities (city_name, locale) VALUES
('New York','en_US'),('Los Angeles','en_US'),('Chicago','en_US'),
('Houston','en_US'),('Phoenix','en_US'),('Philadelphia','en_US'),
('San Antonio','en_US'),('San Diego','en_US'),('Dallas','en_US'),
('San Jose','en_US'),

('Berlin','de_DE'),('Munich','de_DE'),('Hamburg','de_DE'),
('Cologne','de_DE'),('Frankfurt','de_DE'),('Stuttgart','de_DE'),
('Düsseldorf','de_DE'),('Leipzig','de_DE'),('Dresden','de_DE');


DELETE FROM streets;

INSERT INTO streets (street_name, locale) VALUES
('Main St','en_US'),('Oak Street','en_US'),('Pine Street','en_US'),
('Maple Avenue','en_US'),('Cedar Road','en_US'),('Elm Street','en_US'),
('Washington Ave','en_US'),('Lakeview Drive','en_US'),
('Sunset Boulevard','en_US'),

('Hauptstrasse','de_DE'),('Bahnhofstrasse','de_DE'),
('Gartenweg','de_DE'),('Schulstrasse','de_DE'),
('Kirchstrasse','de_DE'),('Bergstrasse','de_DE'),
('Lindenweg','de_DE'),('Goethestrasse','de_DE');
