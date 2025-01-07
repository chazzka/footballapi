defmodule FootballApi.Football.Fixtures do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :date, :score, :league, :club1, :club2, :fixture_goals]}
  schema "fixtures" do
    field :date, :date
    field :score, :string
    belongs_to :league, FootballApi.Football.Leagues
    belongs_to :club1, FootballApi.Football.Clubs
    belongs_to :club2, FootballApi.Football.Clubs

    has_many :fixture_goals, FootballApi.Football.FixtureGoals, foreign_key: :fixture_id
  end

  @doc false
  def changeset(fixtures, attrs) do
    fixtures
    |> cast(attrs, [:date, :score])
    |> validate_required([:date, :score])
  end
end
