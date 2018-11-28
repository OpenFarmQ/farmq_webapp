defmodule FarmQ.Repo.Migrations.CreateFieldPreparationData do
  use Ecto.Migration

  def change do
    create table(:field_preparation_data) do
      add :preparation_date, :date
      add :description, :text
      add :crop_cycle_id, references(:crop_cycles, on_delete: :nothing)

      timestamps()
    end

    create index(:field_preparation_data, [:crop_cycle_id])
  end
end
