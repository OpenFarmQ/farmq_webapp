defmodule FarmQ.Core.Bed do
  use Ecto.Schema
  import Ecto.Changeset


  schema "beds" do
    field :area, :decimal
    field :name, :string
    field :status, :string
    field :location_id, :id

    timestamps()
  end

  @doc false
  def changeset(bed, attrs) do
    bed
    |> cast(attrs, [:name, :area, :status])
    |> validate_required([:name, :area, :status])
  end
end
