defmodule FarmQ.Core.Parameter do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.Sensor

  schema "parameters" do
    field :data_type, :string
    field :description, :string
    field :key, :string
    field :name, :string
    field :unit, :string
    many_to_many :sensors, Sensor, join_through: "sensors_parameters"

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name, :key, :description, :unit, :data_type])
    |> validate_required([:name, :key, :description, :unit, :data_type])
  end
end
