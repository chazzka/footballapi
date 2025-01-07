defmodule FootballApiWeb.ClubsController do
  use FootballApiWeb, :controller

  alias FootballApi.Football
  alias FootballApi.Football.Clubs

  def index(conn, _params) do
    players = Football.list_clubs()
    json(conn, players)
  end

  def show(conn, %{"id" => id}) do
    players = Football.get_clubs!(id)
    json(conn, players)
  end

  def index_by_league(conn, %{"id" => id}) do
    res = Football.get_clubs_by_league(id)
    json(conn, res)
  end
end
