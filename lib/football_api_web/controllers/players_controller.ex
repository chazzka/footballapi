defmodule FootballApiWeb.PlayersController do
  use FootballApiWeb, :controller

  alias FootballApi.Football
  alias FootballApi.Football.Players

  def index(conn, _params) do
    players = Football.list_players()
    json(conn, players)
    # render(conn, :index, players_collection: players)
  end

  def show(conn, %{"id" => id}) do
    players = Football.get_players!(id)
    json(conn, players)
  end

  def index_by_club(conn, %{"id" => club_id}) do
    players = Football.get_players_by_club(club_id)

    if players == [] do
      conn
      |> put_status(:not_found)
      |> json(%{error: "No players found for club ID #{club_id}"})
    else
      json(conn, players)
    end
  end
end
