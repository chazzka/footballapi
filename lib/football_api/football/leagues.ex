defmodule FootballApi.Football.Leagues do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :country, :season]}
  schema "leagues" do
    field :name, :string
    field :country, :string
    field :season, :string
  end

  @doc false
  def changeset(leagues, attrs) do
    leagues
    |> cast(attrs, [:name, :country, :season])
    |> validate_required([:name, :country, :season])
  end
end
