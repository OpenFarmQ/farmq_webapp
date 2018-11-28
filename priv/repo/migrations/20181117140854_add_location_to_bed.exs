defmodule FarmQ.Repo.Migrations.AddLocationToBed do
  use Ecto.Migration

  def change do
    alter table(:field_bots) do
      add :location_id, references(:locations, on_delete: :nothing)
    end
  end

end
