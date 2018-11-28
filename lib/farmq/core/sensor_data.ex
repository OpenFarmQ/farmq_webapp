defmodule FarmQ.Core.SensorData do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sensor_data" do
    field :collected_time, :utc_datetime
    field :value, :decimal
    belongs_to :parameter, FarmQ.Core.Parameter
    belongs_to :bed, FarmQ.Core.Location , foreign_key: :location_id
    belongs_to :field_bot, FarmQ.Core.FieldBot
    belongs_to :user, FarmQ.Core.User


    timestamps()
  end

  @doc false
  def changeset(sensor_data, attrs) do
    sensor_data
    |> cast(attrs, [:value, :collected_time, :parameter_id, :location_id, :field_bot_id, :user_id])
    |> validate_required([:value])
    |> foreign_key_constraint(:parameter_id)
    |> foreign_key_constraint(:location_id)
    |> foreign_key_constraint(:field_bot_id)


  end
end
