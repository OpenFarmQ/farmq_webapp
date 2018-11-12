defmodule FarmQ.Repo.Migrations.CreatePlants do
  use Ecto.Migration

  def change do
    create table(:plants) do
      add :name, :string
      add :image, :string
      add :binomial_name, :string
      add :common_name, {:array, :string}
      add :description, :text
      add :source_name, :string
      add :source_url, :string
      add :data_scrapper_id, :string

      timestamps()
    end

  end
end
