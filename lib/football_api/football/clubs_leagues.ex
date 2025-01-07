defmodule FootballApi.Football.ClubsLeagues do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clubs_leagues" do

    field :league_id, :id
    field :club_id, :id

  end

  @doc false
  def changeset(clubs_leagues, attrs) do
    clubs_leagues
    |> cast(attrs, [])
    |> validate_required([])
  end
end
