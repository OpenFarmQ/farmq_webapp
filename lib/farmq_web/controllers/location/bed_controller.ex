defmodule FarmQWeb.Location.BedController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.Bed

  def index(conn, _params) do
    location = conn.assigns.location
    beds = Core.list_beds()
    render(conn, "index.html", beds: beds, location: location)
  end

  def new(conn, _params) do
    changeset = Core.change_bed(%Bed{})
    location = conn.assigns.location
    render(conn, "new.html", changeset: changeset, location: location)
  end

  def create(conn, %{"bed" => bed_params}) do
    location = conn.assigns.location
    case Core.create_bed(bed_params) do
      {:ok, bed} ->
        conn
        |> put_flash(:info, "Bed created successfully.")
        |> redirect(to: Routes.location_bed_path(conn, :show, location, bed))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = conn.assigns.location
    bed = Core.get_bed!(id)
    render(conn, "show.html", bed: bed, location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = conn.assigns.location
    bed = Core.get_bed!(id)
    changeset = Core.change_bed(bed)
    render(conn, "edit.html", bed: bed, changeset: changeset, location: location)
  end

  def update(conn, %{"id" => id, "bed" => bed_params}) do
    location = conn.assigns.location
    bed = Core.get_bed!(id)

    case Core.update_bed(bed, bed_params) do
      {:ok, bed} ->
        conn
        |> put_flash(:info, "Bed updated successfully.")
        |> redirect(to: Routes.location_bed_path(conn, :show, location, bed))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", bed: bed, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = conn.assigns.location
    bed = Core.get_bed!(id)
    {:ok, _bed} = Core.delete_bed(bed)

    conn
    |> put_flash(:info, "Bed deleted successfully.")
    |> redirect(to: Routes.location_bed_path(conn, :index, location))
  end
end
