defmodule FootballApi.Football do
  @moduledoc """
  The Football context.
  """

  import Ecto.Query, warn: false
  alias FootballApi.Repo

  alias FootballApi.Football.Leagues

  @doc """
  Returns the list of leagues.

  ## Examples

      iex> list_leagues()
      [%Leagues{}, ...]

  """
  def list_leagues do
    Repo.all(Leagues)
  end

  @doc """
  Gets a single leagues.

  Raises `Ecto.NoResultsError` if the Leagues does not exist.

  ## Examples

      iex> get_leagues!(123)
      %Leagues{}

      iex> get_leagues!(456)
      ** (Ecto.NoResultsError)

  """
  def get_leagues!(id), do: Repo.get!(Leagues, id)

  @doc """
  Creates a leagues.

  ## Examples

      iex> create_leagues(%{field: value})
      {:ok, %Leagues{}}

      iex> create_leagues(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_leagues(attrs \\ %{}) do
    %Leagues{}
    |> Leagues.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a leagues.

  ## Examples

      iex> update_leagues(leagues, %{field: new_value})
      {:ok, %Leagues{}}

      iex> update_leagues(leagues, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_leagues(%Leagues{} = leagues, attrs) do
    leagues
    |> Leagues.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a leagues.

  ## Examples

      iex> delete_leagues(leagues)
      {:ok, %Leagues{}}

      iex> delete_leagues(leagues)
      {:error, %Ecto.Changeset{}}

  """
  def delete_leagues(%Leagues{} = leagues) do
    Repo.delete(leagues)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking leagues changes.

  ## Examples

      iex> change_leagues(leagues)
      %Ecto.Changeset{data: %Leagues{}}

  """
  def change_leagues(%Leagues{} = leagues, attrs \\ %{}) do
    Leagues.changeset(leagues, attrs)
  end

  alias FootballApi.Football.Clubs

  @doc """
  Returns the list of clubs.

  ## Examples

      iex> list_clubs()
      [%Clubs{}, ...]

  """
  def list_clubs do
    Repo.all(Clubs)
  end

  @doc """
  Gets a single clubs.

  Raises `Ecto.NoResultsError` if the Clubs does not exist.

  ## Examples

      iex> get_clubs!(123)
      %Clubs{}

      iex> get_clubs!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clubs!(id), do: Repo.get!(Clubs, id)

  @doc """
  Creates a clubs.

  ## Examples

      iex> create_clubs(%{field: value})
      {:ok, %Clubs{}}

      iex> create_clubs(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clubs(attrs \\ %{}) do
    %Clubs{}
    |> Clubs.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clubs.

  ## Examples

      iex> update_clubs(clubs, %{field: new_value})
      {:ok, %Clubs{}}

      iex> update_clubs(clubs, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clubs(%Clubs{} = clubs, attrs) do
    clubs
    |> Clubs.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clubs.

  ## Examples

      iex> delete_clubs(clubs)
      {:ok, %Clubs{}}

      iex> delete_clubs(clubs)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clubs(%Clubs{} = clubs) do
    Repo.delete(clubs)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clubs changes.

  ## Examples

      iex> change_clubs(clubs)
      %Ecto.Changeset{data: %Clubs{}}

  """
  def change_clubs(%Clubs{} = clubs, attrs \\ %{}) do
    Clubs.changeset(clubs, attrs)
  end

  alias FootballApi.Football.Players

  @doc """
  Returns the list of players.

  ## Examples

      iex> list_players()
      [%Players{}, ...]

  """
  def list_players do
    Repo.all(Players) |> Repo.preload(:club)
  end

  @doc """
  Gets a single players.

  Raises `Ecto.NoResultsError` if the Players does not exist.

  ## Examples

      iex> get_players!(123)
      %Players{}

      iex> get_players!(456)
      ** (Ecto.NoResultsError)

  """
  def get_players!(id), do: Repo.get!(Players, id) |> Repo.preload(:club)

  def get_players_by_club(club_id) do
    from(p in Players,
      where: p.club_id == ^club_id,
      order_by: [asc: p.surname, asc: p.name],
      preload: [:club]
    )
    |> Repo.all()
  end

  @doc """
  Creates a players.

  ## Examples

      iex> create_players(%{field: value})
      {:ok, %Players{}}

      iex> create_players(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_players(attrs \\ %{}) do
    %Players{}
    |> Players.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a players.

  ## Examples

      iex> update_players(players, %{field: new_value})
      {:ok, %Players{}}

      iex> update_players(players, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_players(%Players{} = players, attrs) do
    players
    |> Players.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a players.

  ## Examples

      iex> delete_players(players)
      {:ok, %Players{}}

      iex> delete_players(players)
      {:error, %Ecto.Changeset{}}

  """
  def delete_players(%Players{} = players) do
    Repo.delete(players)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking players changes.

  ## Examples

      iex> change_players(players)
      %Ecto.Changeset{data: %Players{}}

  """
  def change_players(%Players{} = players, attrs \\ %{}) do
    Players.changeset(players, attrs)
  end

  alias FootballApi.Football.Fixtures

  @doc """
  Returns the list of fixtures.

  ## Examples

      iex> list_fixtures()
      [%Fixtures{}, ...]

  """
  def list_fixtures do
    Repo.all(Fixtures)
    |> Repo.preload(:league)
    |> Repo.preload(:club1)
    |> Repo.preload(:club2)
    |> Repo.preload(fixture_goals: [player: :club])
  end

  @doc """
  Gets a single fixtures.

  Raises `Ecto.NoResultsError` if the Fixtures does not exist.

  ## Examples

      iex> get_fixtures!(123)
      %Fixtures{}

      iex> get_fixtures!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fixtures!(id),
    do:
      Repo.get!(Fixtures, id)
      |> Repo.preload(:league)
      |> Repo.preload(:club1)
      |> Repo.preload(:club2)
      |> Repo.preload(fixture_goals: [player: :club])


      def get_fixtures_by_league(league_id) do
        from(f in Fixtures,
          where: f.league_id == ^league_id,
          order_by: [asc: f.date],
          preload: [:league, :club1, :club2, fixture_goals: [player: :club]]
        )
        |> Repo.all()
      end

  @doc """
  Creates a fixtures.

  ## Examples

      iex> create_fixtures(%{field: value})
      {:ok, %Fixtures{}}

      iex> create_fixtures(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fixtures(attrs \\ %{}) do
    %Fixtures{}
    |> Fixtures.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fixtures.

  ## Examples

      iex> update_fixtures(fixtures, %{field: new_value})
      {:ok, %Fixtures{}}

      iex> update_fixtures(fixtures, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fixtures(%Fixtures{} = fixtures, attrs) do
    fixtures
    |> Fixtures.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fixtures.

  ## Examples

      iex> delete_fixtures(fixtures)
      {:ok, %Fixtures{}}

      iex> delete_fixtures(fixtures)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fixtures(%Fixtures{} = fixtures) do
    Repo.delete(fixtures)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fixtures changes.

  ## Examples

      iex> change_fixtures(fixtures)
      %Ecto.Changeset{data: %Fixtures{}}

  """
  def change_fixtures(%Fixtures{} = fixtures, attrs \\ %{}) do
    Fixtures.changeset(fixtures, attrs)
  end

  alias FootballApi.Football.FixtureGoals

  @doc """
  Returns the list of fixtures_goals.

  ## Examples

      iex> list_fixtures_goals()
      [%FixtureGoals{}, ...]

  """
  def list_fixtures_goals do
    Repo.all(FixtureGoals) |> Repo.preload(:player)
  end

  @doc """
  Gets a single fixture_goals.

  Raises `Ecto.NoResultsError` if the Fixture goals does not exist.

  ## Examples

      iex> get_fixture_goals!(123)
      %FixtureGoals{}

      iex> get_fixture_goals!(456)
      ** (Ecto.NoResultsError)

  """
  def get_fixture_goals!(id), do: Repo.get!(FixtureGoals, id) |> Repo.preload(:player)

  @doc """
  Creates a fixture_goals.

  ## Examples

      iex> create_fixture_goals(%{field: value})
      {:ok, %FixtureGoals{}}

      iex> create_fixture_goals(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_fixture_goals(attrs \\ %{}) do
    %FixtureGoals{}
    |> FixtureGoals.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a fixture_goals.

  ## Examples

      iex> update_fixture_goals(fixture_goals, %{field: new_value})
      {:ok, %FixtureGoals{}}

      iex> update_fixture_goals(fixture_goals, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_fixture_goals(%FixtureGoals{} = fixture_goals, attrs) do
    fixture_goals
    |> FixtureGoals.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a fixture_goals.

  ## Examples

      iex> delete_fixture_goals(fixture_goals)
      {:ok, %FixtureGoals{}}

      iex> delete_fixture_goals(fixture_goals)
      {:error, %Ecto.Changeset{}}

  """
  def delete_fixture_goals(%FixtureGoals{} = fixture_goals) do
    Repo.delete(fixture_goals)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking fixture_goals changes.

  ## Examples

      iex> change_fixture_goals(fixture_goals)
      %Ecto.Changeset{data: %FixtureGoals{}}

  """
  def change_fixture_goals(%FixtureGoals{} = fixture_goals, attrs \\ %{}) do
    FixtureGoals.changeset(fixture_goals, attrs)
  end

  alias FootballApi.Football.LeagueTable

  def get_league_table_by_league(league_id) do
    from(lt in LeagueTable,
      where: lt.league_id == ^league_id,
      order_by: [desc: lt.points],
      preload: [:league, :club]
    )
    |> Repo.all()
  end

  @doc """
  Creates a league_table.

  ## Examples

      iex> create_league_table(%{field: value})
      {:ok, %LeagueTable{}}

      iex> create_league_table(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_league_table(attrs \\ %{}) do
    %LeagueTable{}
    |> LeagueTable.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a league_table.

  ## Examples

      iex> update_league_table(league_table, %{field: new_value})
      {:ok, %LeagueTable{}}

      iex> update_league_table(league_table, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_league_table(%LeagueTable{} = league_table, attrs) do
    league_table
    |> LeagueTable.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a league_table.

  ## Examples

      iex> delete_league_table(league_table)
      {:ok, %LeagueTable{}}

      iex> delete_league_table(league_table)
      {:error, %Ecto.Changeset{}}

  """
  def delete_league_table(%LeagueTable{} = league_table) do
    Repo.delete(league_table)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking league_table changes.

  ## Examples

      iex> change_league_table(league_table)
      %Ecto.Changeset{data: %LeagueTable{}}

  """
  def change_league_table(%LeagueTable{} = league_table, attrs \\ %{}) do
    LeagueTable.changeset(league_table, attrs)
  end

  alias FootballApi.Football.ClubsLeagues

  @doc """
  Returns the list of clubs_leagues.

  ## Examples

      iex> list_clubs_leagues()
      [%ClubsLeagues{}, ...]

  """
  def list_clubs_leagues do
    Repo.all(ClubsLeagues)
  end

  @doc """
  Gets a single clubs_leagues.

  Raises `Ecto.NoResultsError` if the Clubs leagues does not exist.

  ## Examples

      iex> get_clubs_leagues!(123)
      %ClubsLeagues{}

      iex> get_clubs_leagues!(456)
      ** (Ecto.NoResultsError)

  """
  def get_clubs_leagues!(id), do: Repo.get!(ClubsLeagues, id)

  @doc """
  Creates a clubs_leagues.

  ## Examples

      iex> create_clubs_leagues(%{field: value})
      {:ok, %ClubsLeagues{}}

      iex> create_clubs_leagues(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_clubs_leagues(attrs \\ %{}) do
    %ClubsLeagues{}
    |> ClubsLeagues.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a clubs_leagues.

  ## Examples

      iex> update_clubs_leagues(clubs_leagues, %{field: new_value})
      {:ok, %ClubsLeagues{}}

      iex> update_clubs_leagues(clubs_leagues, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_clubs_leagues(%ClubsLeagues{} = clubs_leagues, attrs) do
    clubs_leagues
    |> ClubsLeagues.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a clubs_leagues.

  ## Examples

      iex> delete_clubs_leagues(clubs_leagues)
      {:ok, %ClubsLeagues{}}

      iex> delete_clubs_leagues(clubs_leagues)
      {:error, %Ecto.Changeset{}}

  """
  def delete_clubs_leagues(%ClubsLeagues{} = clubs_leagues) do
    Repo.delete(clubs_leagues)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking clubs_leagues changes.

  ## Examples

      iex> change_clubs_leagues(clubs_leagues)
      %Ecto.Changeset{data: %ClubsLeagues{}}

  """
  def change_clubs_leagues(%ClubsLeagues{} = clubs_leagues, attrs \\ %{}) do
    ClubsLeagues.changeset(clubs_leagues, attrs)
  end

  def get_clubs_by_league(league_id) do
    from(c in Clubs,
      join: cl in ClubsLeagues,
      on: cl.club_id == c.id,
      where: cl.league_id == ^league_id,
      select: c
    )
    |> Repo.all()
  end
end
