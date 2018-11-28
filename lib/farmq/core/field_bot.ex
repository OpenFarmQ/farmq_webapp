defmodule FarmQ.Core.FieldBot do
  use Ecto.Schema
  import Ecto.Changeset
  alias FarmQ.Core.Location


  schema "field_bots" do
    field :name, :string
    belongs_to :bed, Location, foreign_key: :location_id

    timestamps()
  end

  @doc false
  def changeset(field_bot, attrs) do
    field_bot
    |> cast(attrs, [:name, :location_id])
    |> validate_required([:name])
    |> foreign_key_constraint(:location_id)
  end
end
