defmodule FarmQ.Repo.Migrations.UpdateTablesWithUserId do
  use Ecto.Migration

  def change do
    alter table(:locations) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:field_bots) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:crop_cycles) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:field_preparation_data) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:sowing_data) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:harvest_data) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:field_clearation_data) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    alter table(:sensor_data) do
      add :user_id, references(:users, on_delete: :nothing)
    end

    create index(:locations, [:user_id])
    create index(:field_bots, [:user_id])
    create index(:crop_cycles, [:user_id])
    create index(:field_preparation_data, [:user_id])
    create index(:sowing_data, [:user_id])
    create index(:harvest_data, [:user_id])
    create index(:field_clearation_data, [:user_id])
    create index(:sensor_data, [:user_id])

  end
end
