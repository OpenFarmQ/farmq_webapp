defmodule FarmQ.Repo.Migrations.CreateSowingData do
  use Ecto.Migration

  def change do
    create table(:sowing_data) do
      add :seed_weight, :decimal
      add :expected_yield_value, :decimal
      add :expected_yield_unit, :string
      add :description, :text
      add :sown_date, :date
      add :plant_id, references(:plants, on_delete: :nothing)
      add :crop_cycle_id, references(:crop_cycles, on_delete: :nothing)

      timestamps()
    end

    create index(:sowing_data, [:plant_id])
    create index(:sowing_data, [:crop_cycle_id])
  end
end
