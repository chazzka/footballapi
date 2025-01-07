defmodule FootballApi.Football.Clubs do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :photo, :founded_year, :stadium, :city]}
  schema "clubs" do
    field :name, :string
    field :photo, :string
    field :founded_year, :integer
    field :stadium, :string
    field :city, :string
  end

  @doc false
  def changeset(clubs, attrs) do
    clubs
    |> cast(attrs, [:name, :photo, :founded_year, :stadium, :city])
    |> validate_required([:name, :photo, :founded_year, :stadium, :city])
  end
end
