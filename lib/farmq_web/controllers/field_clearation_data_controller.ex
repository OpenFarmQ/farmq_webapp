defmodule FarmQWeb.FieldClearationDataController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.FieldClearationData

  def index(conn, _params) do
    field_clearation_data = Core.list_field_clearation_data()
    render(conn, "index.html", field_clearation_data: field_clearation_data)
  end

  def new(conn, _params) do
    changeset = Core.change_field_clearation_data(%FieldClearationData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"field_clearation_data" => field_clearation_data_params}) do
    case Core.create_field_clearation_data(field_clearation_data_params) do
      {:ok, field_clearation_data} ->
        conn
        |> put_flash(:info, "Field clearation data created successfully.")
        |> redirect(to: Routes.field_clearation_data_path(conn, :show, field_clearation_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    field_clearation_data = Core.get_field_clearation_data!(id)
    render(conn, "show.html", field_clearation_data: field_clearation_data)
  end

  def edit(conn, %{"id" => id}) do
    field_clearation_data = Core.get_field_clearation_data!(id)
    changeset = Core.change_field_clearation_data(field_clearation_data)
    render(conn, "edit.html", field_clearation_data: field_clearation_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "field_clearation_data" => field_clearation_data_params}) do
    field_clearation_data = Core.get_field_clearation_data!(id)

    case Core.update_field_clearation_data(field_clearation_data, field_clearation_data_params) do
      {:ok, field_clearation_data} ->
        conn
        |> put_flash(:info, "Field clearation data updated successfully.")
        |> redirect(to: Routes.field_clearation_data_path(conn, :show, field_clearation_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", field_clearation_data: field_clearation_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    field_clearation_data = Core.get_field_clearation_data!(id)
    {:ok, _field_clearation_data} = Core.delete_field_clearation_data(field_clearation_data)

    conn
    |> put_flash(:info, "Field clearation data deleted successfully.")
    |> redirect(to: Routes.field_clearation_data_path(conn, :index))
  end
end
