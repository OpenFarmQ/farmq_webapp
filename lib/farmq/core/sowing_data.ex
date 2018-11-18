defmodule FarmQ.Core.SowingData do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.CropCycle

  schema "sowing_data" do
    field :description, :string
    field :expected_yield_unit, :string
    field :expected_yield_value, :decimal
    field :seed_weight, :decimal
    field :sown_date, :date
    field :plant_id, :id
    belongs_to :crop_cycle, CropCycle

    timestamps()
  end

  @doc false
  def changeset(sowing_data, attrs) do
    sowing_data
    |> cast(attrs, [:seed_weight, :expected_yield_value, :expected_yield_unit, :description, :sown_date, :crop_cycle_id])
    |> validate_required([:seed_weight, :expected_yield_value, :expected_yield_unit, :description, :sown_date])
    |> foreign_key_constraint(:crop_cycle_id)
  end
end
