defmodule FarmQ.Repo.Migrations.ReCreateLocations do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :name, :string
      add :description, :text
      add :type, :string
      add :longitude, :decimal
      add :latitude, :decimal
      add :area, :decimal
      add :parent_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:locations, [:parent_id])
  end
end
