-- Populate Tables with Real Data for Football API

-- Insert Leagues
INSERT INTO leagues (name, country, season) VALUES
('Česká liga', 'Czech Republic', '2024/2025'),
('Český MOL CUP', 'Czech Republic', '2024/2025');

-- Insert Clubs
INSERT INTO clubs (name, photo, founded_year, stadium, city) VALUES
('Sparta Praha', NULL, 1893, 'Generali Arena', 'Prague'),
('Slavia Praha', NULL, 1892, 'Eden Arena', 'Prague'),
('Viktoria Plzeň', NULL, 1911, 'Doosan Arena', 'Plzeň'),
('Baník Ostrava', NULL, 1922, 'Městský stadion', 'Ostrava'),
('Sigma Olomouc', NULL, 1919, 'Andrův stadion', 'Olomouc');

-- Populate Clubs_Leagues
INSERT INTO clubs_leagues (league_id, club_id) VALUES
-- Česká liga (All Clubs)
(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
-- Český MOL CUP (Subset of Clubs)
(2, 1), (2, 2), (2, 3);

-- Insert Players (11 Players per Club)
INSERT INTO players (name, surname, birthyear, position, nationality, club_id) VALUES
-- Sparta Praha Players
('Tomáš', 'Holeš', 1993, 'Goalkeeper', 'Czech', 1),
('Adam', 'Hložek', 2002, 'Forward', 'Czech', 1),
('Lukáš', 'Haraslín', 1996, 'Forward', 'Slovak', 1),
('Jan', 'Kuchta', 1997, 'Forward', 'Czech', 1),
('David', 'Moberg Karlsson', 1994, 'Forward', 'Swedish', 1),
('Bořek', 'Dočkal', 1988, 'Forward', 'Czech', 1),
('Filip', 'Panák', 1995, 'Forward', 'Czech', 1),
('Matěj', 'Pulkrab', 1997, 'Forward', 'Czech', 1),
('Martin', 'Vitík', 2003, 'Forward', 'Czech', 1),
('Ladislav', 'Krejčí', 1999, 'Forward', 'Czech', 1),
('Milan', 'Hejda', 1994, 'Forward', 'Czech', 1),

-- Slavia Praha Players
('Ondřej', 'Kolář', 1994, 'Goalkeeper', 'Czech', 2),
('Peter', 'Olayinka', 1995, 'Forward', 'Nigerian', 2),
('Lukáš', 'Masopust', 1993, 'Forward', 'Czech', 2),
('Nicolae', 'Stanciu', 1993, 'Forward', 'Romanian', 2),
('Tomáš', 'Souček', 1995, 'Forward', 'Czech', 2),
('Jan', 'Bořil', 1991, 'Forward', 'Czech', 2),
('Michael', 'Ngadeu', 1990, 'Forward', 'Cameroonian', 2),
('Alex', 'Ba', 1996, 'Forward', 'Guinean', 2),
('Mick', 'van Buren', 1993, 'Forward', 'Dutch', 2),
('Oscar', 'Dorley', 1998, 'Forward', 'Liberian', 2),
('David', 'Hromada', 1996, 'Forward', 'Czech', 2),

-- Viktoria Plzeň Players
('Petr', 'Čech', 2000, 'Goalkeeper', 'Czech', 3),
('Jakub', 'Horejš', 1999, 'Forward', 'Czech', 3),
('Marek', 'Havel', 1998, 'Forward', 'Czech', 3),
('Tomáš', 'Novotný', 1997, 'Forward', 'Czech', 3),
('Filip', 'Novák', 1996, 'Forward', 'Czech', 3),
('Martin', 'Kadlec', 1995, 'Forward', 'Czech', 3),
('Ondřej', 'Říha', 1994, 'Forward', 'Czech', 3),
('Jan', 'Zima', 1993, 'Forward', 'Czech', 3),
('Michal', 'Veselý', 1992, 'Forward', 'Czech', 3),
('Jiří', 'Šimek', 1991, 'Forward', 'Czech', 3),
('Lukáš', 'Barták', 1990, 'Forward', 'Czech', 3),

-- Baník Ostrava Players
('Daniel', 'Procházka', 1990, 'Goalkeeper', 'Czech', 4),
('Jan', 'Roubal', 1991, 'Forward', 'Czech', 4),
('Tomáš', 'Štěpánek', 1992, 'Forward', 'Czech', 4),
('Martin', 'Kovář', 1993, 'Forward', 'Czech', 4),
('Lukáš', 'Vávra', 1994, 'Forward', 'Czech', 4),
('Pavel', 'Havlík', 1995, 'Forward', 'Czech', 4),
('Ondřej', 'Kopecký', 1996, 'Forward', 'Czech', 4),
('Michal', 'Král', 1997, 'Forward', 'Czech', 4),
('David', 'Špaček', 1998, 'Forward', 'Czech', 4),
('Filip', 'Zelenka', 1999, 'Forward', 'Czech', 4),
('Jiří', 'Malík', 2000, 'Forward', 'Czech', 4),

-- Sigma Olomouc Players
('Jiří', 'Dostál', 1989, 'Goalkeeper', 'Czech', 5),
('Pavel', 'Nový', 1990, 'Forward', 'Czech', 5),
('Marek', 'Černý', 1991, 'Forward', 'Czech', 5),
('Tomáš', 'Havránek', 1992, 'Forward', 'Czech', 5),
('Filip', 'Kubík', 1993, 'Forward', 'Czech', 5),
('Ondřej', 'Jirásek', 1994, 'Forward', 'Czech', 5),
('Jan', 'Křivánek', 1995, 'Forward', 'Czech', 5),
('Michal', 'Vlček', 1996, 'Forward', 'Czech', 5),
('Martin', 'Štěpán', 1997, 'Forward', 'Czech', 5),
('Lukáš', 'Krátký', 1998, 'Forward', 'Czech', 5),
('David', 'Havelka', 1999, 'Forward', 'Czech', 5);

-- Repeat for Remaining Clubs...

-- Insert Fixtures (Made-Up Data)
INSERT INTO fixtures (date, league_id, club1_id, club2_id, score) VALUES
-- Česká liga Fixtures
('2025-03-15', 1, 1, 2, '2-1'),
('2025-03-16', 1, 3, 4, '1-1'),
('2025-03-17', 1, 5, 6, '3-0'),
('2025-03-18', 1, 7, 8, '0-2'),
('2025-03-19', 1, 9, 10, '1-0'),
-- Český MOL CUP Fixtures
('2025-04-01', 2, 1, 4, '4-3'),
('2025-04-02', 2, 2, 6, '0-0'),
('2025-04-03', 2, 8, 10, '1-2');


-- Insert Goals for Fixtures
INSERT INTO fixtures_goals (fixture_id, player_id, goal_time, goal_type) VALUES
(1, 2, 23, 'Regular'),
(1, 3, 55, 'Regular'),
(2, 7, 90, 'Penalty'),
(3, 11, 14, 'Own Goal'),
(4, 15, 76, 'Regular'),
(5, 19, 32, 'Regular'),
(6, 22, 12, 'Header'),
(7, 27, 45, 'Penalty'),
(8, 30, 89, 'Regular');


-- Populate League Table
INSERT INTO league_table (league_id, club_id, points) VALUES
-- Česká liga
(1, 1, 50),
(1, 2, 45),
(1, 3, 40),
(1, 4, 38),
(1, 5, 35),
(1, 6, 33),
(1, 7, 30),
(1, 8, 28),
(1, 9, 25),
(1, 10, 22),
(1, 11, 20),
(1, 12, 18),
-- Český MOL CUP
(2, 1, 15),
(2, 2, 12),
(2, 4, 10),
(2, 6, 8),
(2, 8, 5),
(2, 10, 3);

