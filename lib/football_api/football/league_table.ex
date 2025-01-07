defmodule FootballApi.Football.LeagueTable do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :points, :league, :club]}
  schema "league_table" do
    field :points, :integer
    #field :league_id, :id
    belongs_to :league, FootballApi.Football.Leagues
    #field :club_id, :id
    belongs_to :club, FootballApi.Football.Clubs
  end

  @doc false
  def changeset(league_table, attrs) do
    league_table
    |> cast(attrs, [:points])
    |> validate_required([:points])
  end
end
