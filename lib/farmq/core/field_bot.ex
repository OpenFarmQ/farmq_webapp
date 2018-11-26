defmodule FarmQ.Core.FieldBot do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.Location
  alias FarmQ.Core.User



  schema "field_bots" do
    field :name, :string
    belongs_to :bed, Location, foreign_key: :location_id
    has_many :sensor_data, FarmQ.Core.SensorData, on_delete: :nilify_all
    belongs_to :user, User


    timestamps()
  end

  @doc false
  def changeset(field_bot, attrs) do
    field_bot
    |> cast(attrs, [:name, :location_id, :user_id])
    |> validate_required([:name])
    |> foreign_key_constraint(:location_id)
  end
end
