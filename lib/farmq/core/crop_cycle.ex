defmodule FarmQ.Core.CropCycle do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.Location

  alias FarmQ.Core.FieldPreparationData
  alias FarmQ.Core.SowingData
  alias FarmQ.Core.HarvestData
  alias FarmQ.Core.FieldClearationData

  schema "crop_cycles" do
    field :name, :string
    belongs_to :bed, Location, foreign_key: :location_id

    has_one :field_preparation_data, FieldPreparationData, on_delete: :nilify_all
    has_one :sowing_data, SowingData, on_delete: :nilify_all
    has_many :harvest_data, HarvestData, on_delete: :nilify_all
    has_one :field_clearation_data, FieldClearationData, on_delete: :nilify_all

    timestamps()
  end

  @doc false
  def changeset(crop_cycle, attrs) do
    crop_cycle
    |> cast(attrs, [:name, :location_id])
    |> validate_required([:name])
  end
end
