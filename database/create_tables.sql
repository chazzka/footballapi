-- Create Tables for Football API

-- Leagues Table
CREATE TABLE leagues (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    country TEXT NOT NULL,
    season TEXT
);

-- Clubs Table
CREATE TABLE clubs (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    photo TEXT,
    founded_year INTEGER,
    stadium TEXT,
    city TEXT
);

-- tabulka ligy
CREATE TABLE league_table (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    league_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    points INTEGER NOT NULL,
    FOREIGN KEY (league_id) REFERENCES leagues (id),
    FOREIGN KEY (club_id) REFERENCES clubs (id)
);

-- Pivot Table: Clubs in Leagues
CREATE TABLE clubs_leagues (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    league_id INTEGER NOT NULL,
    club_id INTEGER NOT NULL,
    FOREIGN KEY (league_id) REFERENCES leagues (id),
    FOREIGN KEY (club_id) REFERENCES clubs (id)
);

-- Players Table
CREATE TABLE players (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    birthyear INTEGER NOT NULL,
    position TEXT,
    nationality TEXT,
    club_id INTEGER NOT NULL,
    FOREIGN KEY (club_id) REFERENCES clubs (id)
);

-- Fixtures Table
CREATE TABLE fixtures (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    league_id INTEGER NOT NULL,
    club1_id INTEGER NOT NULL,
    club2_id INTEGER NOT NULL,
    score TEXT,
    FOREIGN KEY (league_id) REFERENCES leagues (id),
    FOREIGN KEY (club1_id) REFERENCES clubs (id),
    FOREIGN KEY (club2_id) REFERENCES clubs (id)
);

-- Fixtures Goals Table
CREATE TABLE fixtures_goals (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    fixture_id INTEGER NOT NULL,
    player_id INTEGER NOT NULL,
    goal_time INTEGER,
    goal_type TEXT,
    FOREIGN KEY (fixture_id) REFERENCES fixtures (id),
    FOREIGN KEY (player_id) REFERENCES players (id)
);
