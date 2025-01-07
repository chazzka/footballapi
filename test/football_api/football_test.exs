defmodule FootballApi.FootballTest do
  use FootballApi.DataCase

  alias FootballApi.Football

  describe "leagues" do
    alias FootballApi.Football.Leagues

    import FootballApi.FootballFixtures

    @invalid_attrs %{name: nil, country: nil, season: nil}

    test "list_leagues/0 returns all leagues" do
      leagues = leagues_fixture()
      assert Football.list_leagues() == [leagues]
    end

    test "get_leagues!/1 returns the leagues with given id" do
      leagues = leagues_fixture()
      assert Football.get_leagues!(leagues.id) == leagues
    end

    test "create_leagues/1 with valid data creates a leagues" do
      valid_attrs = %{name: "some name", country: "some country", season: "some season"}

      assert {:ok, %Leagues{} = leagues} = Football.create_leagues(valid_attrs)
      assert leagues.name == "some name"
      assert leagues.country == "some country"
      assert leagues.season == "some season"
    end

    test "create_leagues/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_leagues(@invalid_attrs)
    end

    test "update_leagues/2 with valid data updates the leagues" do
      leagues = leagues_fixture()
      update_attrs = %{name: "some updated name", country: "some updated country", season: "some updated season"}

      assert {:ok, %Leagues{} = leagues} = Football.update_leagues(leagues, update_attrs)
      assert leagues.name == "some updated name"
      assert leagues.country == "some updated country"
      assert leagues.season == "some updated season"
    end

    test "update_leagues/2 with invalid data returns error changeset" do
      leagues = leagues_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_leagues(leagues, @invalid_attrs)
      assert leagues == Football.get_leagues!(leagues.id)
    end

    test "delete_leagues/1 deletes the leagues" do
      leagues = leagues_fixture()
      assert {:ok, %Leagues{}} = Football.delete_leagues(leagues)
      assert_raise Ecto.NoResultsError, fn -> Football.get_leagues!(leagues.id) end
    end

    test "change_leagues/1 returns a leagues changeset" do
      leagues = leagues_fixture()
      assert %Ecto.Changeset{} = Football.change_leagues(leagues)
    end
  end

  describe "clubs" do
    alias FootballApi.Football.Clubs

    import FootballApi.FootballFixtures

    @invalid_attrs %{name: nil, photo: nil, founded_year: nil, stadium: nil, city: nil}

    test "list_clubs/0 returns all clubs" do
      clubs = clubs_fixture()
      assert Football.list_clubs() == [clubs]
    end

    test "get_clubs!/1 returns the clubs with given id" do
      clubs = clubs_fixture()
      assert Football.get_clubs!(clubs.id) == clubs
    end

    test "create_clubs/1 with valid data creates a clubs" do
      valid_attrs = %{name: "some name", photo: "some photo", founded_year: 42, stadium: "some stadium", city: "some city"}

      assert {:ok, %Clubs{} = clubs} = Football.create_clubs(valid_attrs)
      assert clubs.name == "some name"
      assert clubs.photo == "some photo"
      assert clubs.founded_year == 42
      assert clubs.stadium == "some stadium"
      assert clubs.city == "some city"
    end

    test "create_clubs/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_clubs(@invalid_attrs)
    end

    test "update_clubs/2 with valid data updates the clubs" do
      clubs = clubs_fixture()
      update_attrs = %{name: "some updated name", photo: "some updated photo", founded_year: 43, stadium: "some updated stadium", city: "some updated city"}

      assert {:ok, %Clubs{} = clubs} = Football.update_clubs(clubs, update_attrs)
      assert clubs.name == "some updated name"
      assert clubs.photo == "some updated photo"
      assert clubs.founded_year == 43
      assert clubs.stadium == "some updated stadium"
      assert clubs.city == "some updated city"
    end

    test "update_clubs/2 with invalid data returns error changeset" do
      clubs = clubs_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_clubs(clubs, @invalid_attrs)
      assert clubs == Football.get_clubs!(clubs.id)
    end

    test "delete_clubs/1 deletes the clubs" do
      clubs = clubs_fixture()
      assert {:ok, %Clubs{}} = Football.delete_clubs(clubs)
      assert_raise Ecto.NoResultsError, fn -> Football.get_clubs!(clubs.id) end
    end

    test "change_clubs/1 returns a clubs changeset" do
      clubs = clubs_fixture()
      assert %Ecto.Changeset{} = Football.change_clubs(clubs)
    end
  end

  describe "players" do
    alias FootballApi.Football.Players

    import FootballApi.FootballFixtures

    @invalid_attrs %{name: nil, position: nil, surname: nil, birthyear: nil, nationality: nil}

    test "list_players/0 returns all players" do
      players = players_fixture()
      assert Football.list_players() == [players]
    end

    test "get_players!/1 returns the players with given id" do
      players = players_fixture()
      assert Football.get_players!(players.id) == players
    end

    test "create_players/1 with valid data creates a players" do
      valid_attrs = %{name: "some name", position: "some position", surname: "some surname", birthyear: 42, nationality: "some nationality"}

      assert {:ok, %Players{} = players} = Football.create_players(valid_attrs)
      assert players.name == "some name"
      assert players.position == "some position"
      assert players.surname == "some surname"
      assert players.birthyear == 42
      assert players.nationality == "some nationality"
    end

    test "create_players/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_players(@invalid_attrs)
    end

    test "update_players/2 with valid data updates the players" do
      players = players_fixture()
      update_attrs = %{name: "some updated name", position: "some updated position", surname: "some updated surname", birthyear: 43, nationality: "some updated nationality"}

      assert {:ok, %Players{} = players} = Football.update_players(players, update_attrs)
      assert players.name == "some updated name"
      assert players.position == "some updated position"
      assert players.surname == "some updated surname"
      assert players.birthyear == 43
      assert players.nationality == "some updated nationality"
    end

    test "update_players/2 with invalid data returns error changeset" do
      players = players_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_players(players, @invalid_attrs)
      assert players == Football.get_players!(players.id)
    end

    test "delete_players/1 deletes the players" do
      players = players_fixture()
      assert {:ok, %Players{}} = Football.delete_players(players)
      assert_raise Ecto.NoResultsError, fn -> Football.get_players!(players.id) end
    end

    test "change_players/1 returns a players changeset" do
      players = players_fixture()
      assert %Ecto.Changeset{} = Football.change_players(players)
    end
  end

  describe "fixtures" do
    alias FootballApi.Football.Fixtures

    import FootballApi.FootballFixtures

    @invalid_attrs %{date: nil, score: nil}

    test "list_fixtures/0 returns all fixtures" do
      fixtures = fixtures_fixture()
      assert Football.list_fixtures() == [fixtures]
    end

    test "get_fixtures!/1 returns the fixtures with given id" do
      fixtures = fixtures_fixture()
      assert Football.get_fixtures!(fixtures.id) == fixtures
    end

    test "create_fixtures/1 with valid data creates a fixtures" do
      valid_attrs = %{date: ~D[2025-01-06], score: "some score"}

      assert {:ok, %Fixtures{} = fixtures} = Football.create_fixtures(valid_attrs)
      assert fixtures.date == ~D[2025-01-06]
      assert fixtures.score == "some score"
    end

    test "create_fixtures/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_fixtures(@invalid_attrs)
    end

    test "update_fixtures/2 with valid data updates the fixtures" do
      fixtures = fixtures_fixture()
      update_attrs = %{date: ~D[2025-01-07], score: "some updated score"}

      assert {:ok, %Fixtures{} = fixtures} = Football.update_fixtures(fixtures, update_attrs)
      assert fixtures.date == ~D[2025-01-07]
      assert fixtures.score == "some updated score"
    end

    test "update_fixtures/2 with invalid data returns error changeset" do
      fixtures = fixtures_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_fixtures(fixtures, @invalid_attrs)
      assert fixtures == Football.get_fixtures!(fixtures.id)
    end

    test "delete_fixtures/1 deletes the fixtures" do
      fixtures = fixtures_fixture()
      assert {:ok, %Fixtures{}} = Football.delete_fixtures(fixtures)
      assert_raise Ecto.NoResultsError, fn -> Football.get_fixtures!(fixtures.id) end
    end

    test "change_fixtures/1 returns a fixtures changeset" do
      fixtures = fixtures_fixture()
      assert %Ecto.Changeset{} = Football.change_fixtures(fixtures)
    end
  end

  describe "fixtures_goals" do
    alias FootballApi.Football.FixtureGoals

    import FootballApi.FootballFixtures

    @invalid_attrs %{goal_time: nil, goal_type: nil}

    test "list_fixtures_goals/0 returns all fixtures_goals" do
      fixture_goals = fixture_goals_fixture()
      assert Football.list_fixtures_goals() == [fixture_goals]
    end

    test "get_fixture_goals!/1 returns the fixture_goals with given id" do
      fixture_goals = fixture_goals_fixture()
      assert Football.get_fixture_goals!(fixture_goals.id) == fixture_goals
    end

    test "create_fixture_goals/1 with valid data creates a fixture_goals" do
      valid_attrs = %{goal_time: 42, goal_type: "some goal_type"}

      assert {:ok, %FixtureGoals{} = fixture_goals} = Football.create_fixture_goals(valid_attrs)
      assert fixture_goals.goal_time == 42
      assert fixture_goals.goal_type == "some goal_type"
    end

    test "create_fixture_goals/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_fixture_goals(@invalid_attrs)
    end

    test "update_fixture_goals/2 with valid data updates the fixture_goals" do
      fixture_goals = fixture_goals_fixture()
      update_attrs = %{goal_time: 43, goal_type: "some updated goal_type"}

      assert {:ok, %FixtureGoals{} = fixture_goals} = Football.update_fixture_goals(fixture_goals, update_attrs)
      assert fixture_goals.goal_time == 43
      assert fixture_goals.goal_type == "some updated goal_type"
    end

    test "update_fixture_goals/2 with invalid data returns error changeset" do
      fixture_goals = fixture_goals_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_fixture_goals(fixture_goals, @invalid_attrs)
      assert fixture_goals == Football.get_fixture_goals!(fixture_goals.id)
    end

    test "delete_fixture_goals/1 deletes the fixture_goals" do
      fixture_goals = fixture_goals_fixture()
      assert {:ok, %FixtureGoals{}} = Football.delete_fixture_goals(fixture_goals)
      assert_raise Ecto.NoResultsError, fn -> Football.get_fixture_goals!(fixture_goals.id) end
    end

    test "change_fixture_goals/1 returns a fixture_goals changeset" do
      fixture_goals = fixture_goals_fixture()
      assert %Ecto.Changeset{} = Football.change_fixture_goals(fixture_goals)
    end
  end

  describe "league_table" do
    alias FootballApi.Football.LeagueTable

    import FootballApi.FootballFixtures

    @invalid_attrs %{points: nil}

    test "list_league_table/0 returns all league_table" do
      league_table = league_table_fixture()
      assert Football.list_league_table() == [league_table]
    end

    test "get_league_table!/1 returns the league_table with given id" do
      league_table = league_table_fixture()
      assert Football.get_league_table!(league_table.id) == league_table
    end

    test "create_league_table/1 with valid data creates a league_table" do
      valid_attrs = %{points: 42}

      assert {:ok, %LeagueTable{} = league_table} = Football.create_league_table(valid_attrs)
      assert league_table.points == 42
    end

    test "create_league_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_league_table(@invalid_attrs)
    end

    test "update_league_table/2 with valid data updates the league_table" do
      league_table = league_table_fixture()
      update_attrs = %{points: 43}

      assert {:ok, %LeagueTable{} = league_table} = Football.update_league_table(league_table, update_attrs)
      assert league_table.points == 43
    end

    test "update_league_table/2 with invalid data returns error changeset" do
      league_table = league_table_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_league_table(league_table, @invalid_attrs)
      assert league_table == Football.get_league_table!(league_table.id)
    end

    test "delete_league_table/1 deletes the league_table" do
      league_table = league_table_fixture()
      assert {:ok, %LeagueTable{}} = Football.delete_league_table(league_table)
      assert_raise Ecto.NoResultsError, fn -> Football.get_league_table!(league_table.id) end
    end

    test "change_league_table/1 returns a league_table changeset" do
      league_table = league_table_fixture()
      assert %Ecto.Changeset{} = Football.change_league_table(league_table)
    end
  end

  describe "clubs_leagues" do
    alias FootballApi.Football.ClubsLeagues

    import FootballApi.FootballFixtures

    @invalid_attrs %{}

    test "list_clubs_leagues/0 returns all clubs_leagues" do
      clubs_leagues = clubs_leagues_fixture()
      assert Football.list_clubs_leagues() == [clubs_leagues]
    end

    test "get_clubs_leagues!/1 returns the clubs_leagues with given id" do
      clubs_leagues = clubs_leagues_fixture()
      assert Football.get_clubs_leagues!(clubs_leagues.id) == clubs_leagues
    end

    test "create_clubs_leagues/1 with valid data creates a clubs_leagues" do
      valid_attrs = %{}

      assert {:ok, %ClubsLeagues{} = clubs_leagues} = Football.create_clubs_leagues(valid_attrs)
    end

    test "create_clubs_leagues/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Football.create_clubs_leagues(@invalid_attrs)
    end

    test "update_clubs_leagues/2 with valid data updates the clubs_leagues" do
      clubs_leagues = clubs_leagues_fixture()
      update_attrs = %{}

      assert {:ok, %ClubsLeagues{} = clubs_leagues} = Football.update_clubs_leagues(clubs_leagues, update_attrs)
    end

    test "update_clubs_leagues/2 with invalid data returns error changeset" do
      clubs_leagues = clubs_leagues_fixture()
      assert {:error, %Ecto.Changeset{}} = Football.update_clubs_leagues(clubs_leagues, @invalid_attrs)
      assert clubs_leagues == Football.get_clubs_leagues!(clubs_leagues.id)
    end

    test "delete_clubs_leagues/1 deletes the clubs_leagues" do
      clubs_leagues = clubs_leagues_fixture()
      assert {:ok, %ClubsLeagues{}} = Football.delete_clubs_leagues(clubs_leagues)
      assert_raise Ecto.NoResultsError, fn -> Football.get_clubs_leagues!(clubs_leagues.id) end
    end

    test "change_clubs_leagues/1 returns a clubs_leagues changeset" do
      clubs_leagues = clubs_leagues_fixture()
      assert %Ecto.Changeset{} = Football.change_clubs_leagues(clubs_leagues)
    end
  end
end
