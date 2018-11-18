defmodule FarmQWeb.FieldPreparationDataController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.FieldPreparationData

  def index(conn, _params) do
    field_preparation_data = Core.list_field_preparation_data()
    render(conn, "index.html", field_preparation_data: field_preparation_data)
  end

  def new(conn, _params) do
    changeset = Core.change_field_preparation_data(%FieldPreparationData{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"field_preparation_data" => field_preparation_data_params}) do
    case Core.create_field_preparation_data(field_preparation_data_params) do
      {:ok, field_preparation_data} ->
        conn
        |> put_flash(:info, "Field preparation data created successfully.")
        |> redirect(to: Routes.field_preparation_data_path(conn, :show, field_preparation_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    field_preparation_data = Core.get_field_preparation_data!(id)
    render(conn, "show.html", field_preparation_data: field_preparation_data)
  end

  def edit(conn, %{"id" => id}) do
    field_preparation_data = Core.get_field_preparation_data!(id)
    changeset = Core.change_field_preparation_data(field_preparation_data)
    render(conn, "edit.html", field_preparation_data: field_preparation_data, changeset: changeset)
  end

  def update(conn, %{"id" => id, "field_preparation_data" => field_preparation_data_params}) do
    field_preparation_data = Core.get_field_preparation_data!(id)

    case Core.update_field_preparation_data(field_preparation_data, field_preparation_data_params) do
      {:ok, field_preparation_data} ->
        conn
        |> put_flash(:info, "Field preparation data updated successfully.")
        |> redirect(to: Routes.field_preparation_data_path(conn, :show, field_preparation_data))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", field_preparation_data: field_preparation_data, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    field_preparation_data = Core.get_field_preparation_data!(id)
    {:ok, _field_preparation_data} = Core.delete_field_preparation_data(field_preparation_data)

    conn
    |> put_flash(:info, "Field preparation data deleted successfully.")
    |> redirect(to: Routes.field_preparation_data_path(conn, :index))
  end
end
