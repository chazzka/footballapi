defmodule FootballApi.FootballFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FootballApi.Football` context.
  """

  @doc """
  Generate a leagues.
  """
  def leagues_fixture(attrs \\ %{}) do
    {:ok, leagues} =
      attrs
      |> Enum.into(%{
        country: "some country",
        name: "some name",
        season: "some season"
      })
      |> FootballApi.Football.create_leagues()

    leagues
  end

  @doc """
  Generate a clubs.
  """
  def clubs_fixture(attrs \\ %{}) do
    {:ok, clubs} =
      attrs
      |> Enum.into(%{
        city: "some city",
        founded_year: 42,
        name: "some name",
        photo: "some photo",
        stadium: "some stadium"
      })
      |> FootballApi.Football.create_clubs()

    clubs
  end

  @doc """
  Generate a players.
  """
  def players_fixture(attrs \\ %{}) do
    {:ok, players} =
      attrs
      |> Enum.into(%{
        birthyear: 42,
        name: "some name",
        nationality: "some nationality",
        position: "some position",
        surname: "some surname"
      })
      |> FootballApi.Football.create_players()

    players
  end

  @doc """
  Generate a fixtures.
  """
  def fixtures_fixture(attrs \\ %{}) do
    {:ok, fixtures} =
      attrs
      |> Enum.into(%{
        date: ~D[2025-01-06],
        score: "some score"
      })
      |> FootballApi.Football.create_fixtures()

    fixtures
  end

  @doc """
  Generate a fixture_goals.
  """
  def fixture_goals_fixture(attrs \\ %{}) do
    {:ok, fixture_goals} =
      attrs
      |> Enum.into(%{
        goal_time: 42,
        goal_type: "some goal_type"
      })
      |> FootballApi.Football.create_fixture_goals()

    fixture_goals
  end

  @doc """
  Generate a league_table.
  """
  def league_table_fixture(attrs \\ %{}) do
    {:ok, league_table} =
      attrs
      |> Enum.into(%{
        points: 42
      })
      |> FootballApi.Football.create_league_table()

    league_table
  end

  @doc """
  Generate a clubs_leagues.
  """
  def clubs_leagues_fixture(attrs \\ %{}) do
    {:ok, clubs_leagues} =
      attrs
      |> Enum.into(%{

      })
      |> FootballApi.Football.create_clubs_leagues()

    clubs_leagues
  end
end
