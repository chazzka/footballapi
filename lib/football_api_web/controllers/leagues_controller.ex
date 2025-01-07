defmodule FootballApiWeb.LeaguesController do
  use FootballApiWeb, :controller

  alias FootballApi.Football
  alias FootballApi.Football.Clubs

  def index(conn, _params) do
    leagues = Football.list_leagues()
    json(conn, leagues)
  end

  def show(conn, %{"id" => id}) do
    leagues = Football.get_leagues!(id)
    json(conn, leagues)
  end
end
