defmodule FarmQ.Repo.Migrations.CreateFieldClearationData do
  use Ecto.Migration

  def change do
    create table(:field_clearation_data) do
      add :clearation_date, :date
      add :description, :text
      add :crop_cycle_id, references(:crop_cycles, on_delete: :nothing)

      timestamps()
    end

    create index(:field_clearation_data, [:crop_cycle_id])
  end
end
