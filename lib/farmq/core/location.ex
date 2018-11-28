defmodule FarmQ.Core.Location do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.FieldBot
  alias FarmQ.Core.CropCycle
  alias __MODULE__


  schema "locations" do
    field :area, :decimal
    field :description, :string
    field :latitude, :decimal
    field :longitude, :decimal
    field :name, :string
    field :type, :string
    belongs_to :parent, Location
    has_many :field_bots, FieldBot, on_delete: :nilify_all
    has_many :crop_cycles, CropCycle

    timestamps()
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:name, :description, :type, :longitude, :latitude, :area, :parent_id])
    |> validate_required([:name, :description, :type, :longitude, :latitude, :area])
  end
end
