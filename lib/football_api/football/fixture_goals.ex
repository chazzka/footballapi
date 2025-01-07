defmodule FootballApi.Football.FixtureGoals do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :goal_time, :goal_type, :player]}
  schema "fixtures_goals" do
    field :goal_time, :integer
    field :goal_type, :string
    field :fixture_id, :id
    belongs_to :player, FootballApi.Football.Players
  end

  @doc false
  def changeset(fixture_goals, attrs) do
    fixture_goals
    |> cast(attrs, [:goal_time, :goal_type])
    |> validate_required([:goal_time, :goal_type])
  end
end
