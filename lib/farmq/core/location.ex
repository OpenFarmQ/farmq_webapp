defmodule FarmQ.Core.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :description, :string
    field :latitude, :decimal
    field :location_type, :string
    field :longitude, :decimal
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description, :location_type, :latitude, :longitude])
    |> validate_required([:name, :description, :location_type, :latitude, :longitude])
  end
end
