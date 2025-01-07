defmodule FootballApiWeb.FixturesController do
  use FootballApiWeb, :controller

  alias FootballApi.Football
  alias FootballApi.Football.Clubs

  def index(conn, _params) do
    all = Football.list_fixtures()
    json(conn, all)
  end

  def show(conn, %{"id" => id}) do
    one = Football.get_fixtures!(id)
    json(conn, one)
  end

  def index_by_league(conn, %{"id" => league_id}) do
    fixtures = Football.get_fixtures_by_league(league_id)

    if fixtures == [] do
      conn
      |> put_status(:not_found)
      |> json(%{error: "No fixtures found for league ID #{league_id}"})
    else
      json(conn, fixtures)
    end
  end
end
