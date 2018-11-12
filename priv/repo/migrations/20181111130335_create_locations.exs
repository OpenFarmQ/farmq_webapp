defmodule FarmQ.Repo.Migrations.CreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :description, :text
      add :location_type, :string
      add :latitude, :decimal
      add :longitude, :decimal

      timestamps()
    end

  end
end
