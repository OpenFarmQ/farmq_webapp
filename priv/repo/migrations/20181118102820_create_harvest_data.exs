defmodule FarmQ.Repo.Migrations.CreateHarvestData do
  use Ecto.Migration

  def change do
    create table(:harvest_data) do
      add :actual_yield_value, :decimal
      add :actual_yield_unit, :string
      add :yield_quality, :string
      add :description, :text
      add :harvest_date, :date
      add :crop_cycle_id, references(:crop_cycles, on_delete: :nothing)

      timestamps()
    end

    create index(:harvest_data, [:crop_cycle_id])
  end
end
