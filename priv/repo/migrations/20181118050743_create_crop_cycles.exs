defmodule FarmQ.Repo.Migrations.CreateCropCycles do
  use Ecto.Migration

  def change do
    create table(:crop_cycles) do
      add :name, :string
      add :bed_id, references(:locations, on_delete: :nothing)

      timestamps()
    end

    create index(:crop_cycles, [:bed_id])
  end
end
