defmodule FarmQ.Core.FieldClearationData do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.CropCycle


  schema "field_clearation_data" do
    field :clearation_date, :date
    field :description, :string
    belongs_to :crop_cycle, CropCycle

    timestamps()
  end

  @doc false
  def changeset(field_clearation_data, attrs) do
    field_clearation_data
    |> cast(attrs, [:clearation_date, :description, :crop_cycle_id])
    |> validate_required([:clearation_date, :description])
    |> foreign_key_constraint(:crop_cycle_id)
  end
end