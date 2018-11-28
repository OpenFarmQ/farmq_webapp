defmodule FarmQWeb.HarvestDataController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.HarvestData

  def index(conn, _params) do
    harvest_data = Core.list_harvest_data()
    render(conn, "index.html", harvest_data: harvest_data)
  end

  def new(conn, _params) do
    changeset = Core.change_harvest_data(%HarvestData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"harvest_data" => harvest_data_params}) do
    case Core.create_harvest_data(harvest_data_params) do
      {:ok, harvest_data} ->
        conn
        |> put_flash(:info, "Harvest data created successfully.")
        |> redirect(to: Routes.harvest_data_path(conn, :show, harvest_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    harvest_data = Core.get_harvest_data!(id)
    render(conn, "show.html", harvest_data: harvest_data)
  end

  def edit(conn, %{"id" => id}) do
    harvest_data = Core.get_harvest_data!(id)
    changeset = Core.change_harvest_data(harvest_data)
    render(conn, "edit.html", harvest_data: harvest_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "harvest_data" => harvest_data_params}) do
    harvest_data = Core.get_harvest_data!(id)

    case Core.update_harvest_data(harvest_data, harvest_data_params) do
      {:ok, harvest_data} ->
        conn
        |> put_flash(:info, "Harvest data updated successfully.")
        |> redirect(to: Routes.harvest_data_path(conn, :show, harvest_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", harvest_data: harvest_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    harvest_data = Core.get_harvest_data!(id)
    {:ok, _harvest_data} = Core.delete_harvest_data(harvest_data)

    conn
    |> put_flash(:info, "Harvest data deleted successfully.")
    |> redirect(to: Routes.harvest_data_path(conn, :index))
  end
end
