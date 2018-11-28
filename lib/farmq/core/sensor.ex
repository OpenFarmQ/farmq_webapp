defmodule FarmQ.Core.Sensor do
  use Ecto.Schema
  import Ecto.Changeset

  alias FarmQ.Core.Parameter

  schema "sensors" do
    field :description, :string
    field :name, :string
    field :url, :string
    many_to_many :parameters, Parameter, join_through: "sensors_parameters"

    timestamps()
  end

  @doc false
  def changeset(sensor, attrs) do
    sensor
    |> cast(attrs, [:name, :description, :url])
    |> validate_required([:name, :description, :url])
  end
end
