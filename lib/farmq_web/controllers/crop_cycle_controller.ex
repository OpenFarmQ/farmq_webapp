defmodule FarmQWeb.CropCycleController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.CropCycle

  def index(conn, _params) do
    crop_cycles = Core.list_crop_cycles()
    render(conn, "index.html", crop_cycles: crop_cycles)
  end

  def new(conn, _params) do
    changeset = Core.change_crop_cycle(%CropCycle{})
    beds = Core.list_locations("Bed")
    render(conn, "new.html", beds: beds, changeset: changeset)
  end

  def create(conn, %{"crop_cycle" => crop_cycle_params}) do
    case Core.create_crop_cycle(crop_cycle_params) do
      {:ok, crop_cycle} ->
        conn
        |> put_flash(:info, "Crop cycle created successfully.")
        |> redirect(to: Routes.crop_cycle_path(conn, :show, crop_cycle))

      {:error, %Ecto.Changeset{} = changeset} ->
        beds = Core.list_locations("Bed")
        render(conn, "new.html", beds: beds, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    field_preparation_data = Core.list_field_preparation_data(crop_cycle)

    render(
      conn,
      "show.html",
      field_preparation_data: field_preparation_data,
      crop_cycle: crop_cycle
      )
  end

  def edit(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    changeset = Core.change_crop_cycle(crop_cycle)
    beds = Core.list_locations("Bed")
    render(conn, "edit.html", beds: beds, crop_cycle: crop_cycle, changeset: changeset)
  end

  def update(conn, %{"id" => id, "crop_cycle" => crop_cycle_params}) do
    crop_cycle = Core.get_crop_cycle!(id)

    case Core.update_crop_cycle(crop_cycle, crop_cycle_params) do
      {:ok, crop_cycle} ->
        conn
        |> put_flash(:info, "Crop cycle updated successfully.")
        |> redirect(to: Routes.crop_cycle_path(conn, :show, crop_cycle))

      {:error, %Ecto.Changeset{} = changeset} ->
        beds = Core.list_locations("Bed")
        render(conn, "edit.html", beds: beds, crop_cycle: crop_cycle, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    {:ok, _crop_cycle} = Core.delete_crop_cycle(crop_cycle)

    conn
    |> put_flash(:info, "Crop cycle deleted successfully.")
    |> redirect(to: Routes.crop_cycle_path(conn, :index))
  end
end
