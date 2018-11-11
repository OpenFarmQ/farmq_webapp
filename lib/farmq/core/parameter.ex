defmodule FarmQ.Core.Parameter do
  use Ecto.Schema
  import Ecto.Changeset


  schema "parameters" do
    field :data_type, :string
    field :description, :string
    field :key, :string
    field :name, :string
    field :unit, :string

    timestamps()
  end

  @doc false
  def changeset(parameter, attrs) do
    parameter
    |> cast(attrs, [:name, :key, :description, :unit, :data_type])
    |> validate_required([:name, :key, :description, :unit, :data_type])
  end
end
