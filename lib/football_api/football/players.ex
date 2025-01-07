defmodule FootballApi.Football.Players do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :surname, :birthyear, :position, :nationality, :club]}
  schema "players" do
    field :name, :string
    field :position, :string
    field :surname, :string
    field :birthyear, :integer
    field :nationality, :string
    belongs_to :club, FootballApi.Football.Clubs
  end

  @doc false
  def changeset(players, attrs) do
    players
    |> cast(attrs, [:name, :surname, :birthyear, :position, :nationality])
    |> validate_required([:name, :surname, :birthyear, :position, :nationality])
  end
end
