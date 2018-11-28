defmodule FarmQ.Core.HarvestData do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.CropCycle
  alias FarmQ.Core.User



  schema "harvest_data" do
    field :actual_yield_unit, :string
    field :actual_yield_value, :decimal
    field :yield_quality, :string
    field :description, :string
    field :harvest_date, :date
    belongs_to :crop_cycle, CropCycle
    belongs_to :user, User


    timestamps()
  end

  @doc false
  def changeset(harvest_data, attrs) do
    harvest_data
    |> cast(attrs, [:actual_yield_value, :actual_yield_unit, :yield_quality, :description, :harvest_date, :crop_cycle_id, :user_id])
    |> validate_required([:actual_yield_value, :actual_yield_unit, :description, :harvest_date])

  end
end
