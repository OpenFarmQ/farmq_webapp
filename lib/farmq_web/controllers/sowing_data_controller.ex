defmodule FarmQWeb.SowingDataController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.SowingData

  def index(conn, _params) do
    sowing_data = Core.list_sowing_data()
    render(conn, "index.html", sowing_data: sowing_data)
  end

  def new(conn, _params) do
    changeset = Core.change_sowing_data(%SowingData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sowing_data" => sowing_data_params}) do
    case Core.create_sowing_data(sowing_data_params) do
      {:ok, sowing_data} ->
        conn
        |> put_flash(:info, "Sowing data created successfully.")
        |> redirect(to: Routes.sowing_data_path(conn, :show, sowing_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sowing_data = Core.get_sowing_data!(id)
    render(conn, "show.html", sowing_data: sowing_data)
  end

  def edit(conn, %{"id" => id}) do
    sowing_data = Core.get_sowing_data!(id)
    changeset = Core.change_sowing_data(sowing_data)
    render(conn, "edit.html", sowing_data: sowing_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sowing_data" => sowing_data_params}) do
    sowing_data = Core.get_sowing_data!(id)

    case Core.update_sowing_data(sowing_data, sowing_data_params) do
      {:ok, sowing_data} ->
        conn
        |> put_flash(:info, "Sowing data updated successfully.")
        |> redirect(to: Routes.sowing_data_path(conn, :show, sowing_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sowing_data: sowing_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sowing_data = Core.get_sowing_data!(id)
    {:ok, _sowing_data} = Core.delete_sowing_data(sowing_data)

    conn
    |> put_flash(:info, "Sowing data deleted successfully.")
    |> redirect(to: Routes.sowing_data_path(conn, :index))
  end
end
