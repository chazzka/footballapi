defmodule FootballApiWeb.TablesController do
  use FootballApiWeb, :controller

  alias FootballApi.Football
  alias FootballApi.Football.Clubs

  def index_by_league(conn, %{"id" => league_id}) do
    league_table = Football.get_league_table_by_league(league_id)
    json(conn, league_table)
  end
end
