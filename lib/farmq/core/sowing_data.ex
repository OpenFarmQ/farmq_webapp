defmodule FarmQ.Core.SowingData do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.CropCycle
  alias FarmQ.Core.Plant
  alias FarmQ.Core.User


  schema "sowing_data" do
    field :description, :string
    field :expected_yield_unit, :string
    field :expected_yield_value, :decimal
    field :seed_weight, :decimal
    field :sown_date, :date
    belongs_to :plant, Plant
    belongs_to :crop_cycle, CropCycle, foreign_key: :crop_cycle_id
    belongs_to :user, User
    timestamps()
  end

  @doc false
  def changeset(sowing_data, attrs) do
    sowing_data
    |> cast(attrs, [:seed_weight, :expected_yield_value, :expected_yield_unit, :description, :sown_date, :crop_cycle_id, :plant_id, :user_id])
    |> validate_required([:seed_weight, :expected_yield_value, :expected_yield_unit, :description, :sown_date, :crop_cycle_id, :plant_id])
    |> foreign_key_constraint(:crop_cycle_id)
    |> foreign_key_constraint(:plant_id)

  end
end
