defmodule FarmQ.Core.Location do
  use Ecto.Schema
  import Ecto.Changeset


  schema "locations" do
    field :area, :decimal
    field :description, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :name, :string
    field :type, :string
    field :parent_id, :id

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description, :type, :longitude, :latitude, :area])
    |> validate_required([:name, :description, :type, :longitude, :latitude, :area])
  end
end
