defmodule FarmQWeb.PlantController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.Plant

  def index(conn, _params) do
    plants = Core.list_plants()
    render(conn, "index.html", plants: plants)
  end

  def new(conn, _params) do
    changeset = Core.change_plant(%Plant{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"plant" => plant_params}) do
    case Core.create_plant(plant_params) do
      {:ok, plant} ->
        conn
        |> put_flash(:info, "Plant created successfully.")
        |> redirect(to: Routes.plant_path(conn, :show, plant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    plant = Core.get_plant!(id)
    render(conn, "show.html", plant: plant)
  end

  def edit(conn, %{"id" => id}) do
    plant = Core.get_plant!(id)
    changeset = Core.change_plant(plant)
    render(conn, "edit.html", plant: plant, changeset: changeset)
  end

  def update(conn, %{"id" => id, "plant" => plant_params}) do
    plant = Core.get_plant!(id)

    case Core.update_plant(plant, plant_params) do
      {:ok, plant} ->
        conn
        |> put_flash(:info, "Plant updated successfully.")
        |> redirect(to: Routes.plant_path(conn, :show, plant))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", plant: plant, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    plant = Core.get_plant!(id)
    {:ok, _plant} = Core.delete_plant(plant)

    conn
    |> put_flash(:info, "Plant deleted successfully.")
    |> redirect(to: Routes.plant_path(conn, :index))
  end
end
