defmodule FarmQ.Core.CropCycle do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.FieldPreparationData

  schema "crop_cycles" do
    field :name, :string
    field :bed_id, :id

    has_many :field_preparation_data, FieldPreparationData
    timestamps()
  end

  @doc false
  def changeset(crop_cycle, attrs) do
    crop_cycle
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
