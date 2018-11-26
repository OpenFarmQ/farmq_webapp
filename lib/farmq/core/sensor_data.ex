defmodule FarmQ.Core.SensorData do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.Location
  alias FarmQ.Core.FieldBot
  alias FarmQ.Core.Parameter



  schema "sensor_data" do
    field :collected_time, :utc_datetime
    field :value, :decimal
    belongs_to :parameter, Parameter
    belongs_to :bed, Location, foreign_key: :location_id
    belongs_to :field_bot, FieldBot

    timestamps()
  end

  @doc false
  def changeset(sensor_data, attrs) do
    sensor_data
    |> cast(attrs, [:collected_time, :value, :parameter_id, :location_id, :field_bot_id])
    |> validate_required([:value, :parameter_id])
    |> foreign_key_constraint(:parameter_id)
  end
end
