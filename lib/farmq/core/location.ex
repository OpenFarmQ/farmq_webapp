defmodule FarmQ.Core.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.FieldBot


  schema "locations" do
    field :area, :decimal
    field :description, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :name, :string
    field :type, :string
    field :parent_id, :id
    has_many :field_bots, FieldBot, on_delete: :nilify_all

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description, :type, :longitude, :latitude, :area])
    |> validate_required([:name, :description, :type, :longitude, :latitude, :area])
  end
end
