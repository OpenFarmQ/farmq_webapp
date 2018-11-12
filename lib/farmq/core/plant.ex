defmodule FarmQ.Core.Plant do
  use Ecto.Schema
  import Ecto.Changeset


  schema "plants" do
    field :binomial_name, :string
    field :common_name, {:array, :string}
    field :data_scrapper_id, :string
    field :description, :string
    field :image, :string
    field :name, :string
    field :source_name, :string
    field :source_url, :string

    timestamps()
  end

  @doc false
  def changeset(plant, attrs) do
    plant
    |> cast(attrs, [:name, :image, :binomial_name, :common_name, :description, :source_name, :source_url, :data_scrapper_id])
    |> validate_required([:name, :image, :binomial_name, :common_name, :description, :source_name, :source_url])
  end
end
