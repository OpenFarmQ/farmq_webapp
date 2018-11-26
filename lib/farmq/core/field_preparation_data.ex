defmodule FarmQ.Core.FieldPreparationData do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.CropCycle
  alias FarmQ.Core.User


  schema "field_preparation_data" do
    field :description, :string
    field :preparation_date, :date
    belongs_to :crop_cycle, CropCycle
    belongs_to :user, User


    timestamps()
  end

  @doc false
  def changeset(field_preparation_data, attrs) do
    field_preparation_data
    |> cast(attrs, [:preparation_date, :description, :crop_cycle_id, :user_id])
    |> validate_required([:preparation_date, :description])
    |> foreign_key_constraint(:crop_cycle_id)
  end
end
