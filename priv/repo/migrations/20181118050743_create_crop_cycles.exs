defmodule FarmQ.Repo.Migrations.CreateCropCycles do
  use Ecto.Migration

  def change do
    create table(:crop_cycles) do
      add :name, :string
      add :location_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:crop_cycles, [:location_id])
  end
end
