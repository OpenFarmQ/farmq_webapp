defmodule FarmQ.Core.FieldBot do
  use Ecto.Schema
  import Ecto.Changeset


  schema "field_bots" do
    field :name, :string
    field :location_id, :id
    field :bed_id, :id

    timestamps()
  end

  @doc false
  def changeset(field_bot, attrs) do
    field_bot
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
