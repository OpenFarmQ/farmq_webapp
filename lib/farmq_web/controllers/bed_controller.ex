defmodule FarmQWeb.BedController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.Location

  def index(conn, _params) do
    user = conn.assigns.current_user
    locations = Core.list_locations_by_user("Bed", user)
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    changeset = Core.change_location(%Location{})
    user = conn.assigns.current_user
    farms = Core.list_locations_by_user("Farm", user)
    render(conn, "new.html", changeset: changeset, farms: farms)
  end

  def create(conn, %{"location" => location_params}) do
    user = conn.assigns.current_user
    location_params = Map.put(location_params, "user_id", user.id)

    case Core.create_location(location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location created successfully.")
        |> redirect(to: Routes.bed_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    location = Core.get_location!(id)
    render(conn, "show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Core.get_location!(id)
    changeset = Core.change_location(location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Core.get_location!(id)

    case Core.update_location(location, location_params) do
      {:ok, location} ->
        conn
        |> put_flash(:info, "Location updated successfully.")
        |> redirect(to: Routes.bed_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Core.get_location!(id)
    {:ok, _location} = Core.delete_location(location)

    conn
    |> put_flash(:info, "Location deleted successfully.")
    |> redirect(to: Routes.bed_path(conn, :index))
  end
end
