defmodule FarmQWeb.ParameterController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.Parameter

  def index(conn, _params) do
    parameters = Core.list_parameters()
    render(conn, "index.html", parameters: parameters)
  end

  def new(conn, _params) do
    changeset = Core.change_parameter(%Parameter{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"parameter" => parameter_params}) do
    case Core.create_parameter(parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter created successfully.")
        |> redirect(to: Routes.parameter_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    parameter = Core.get_parameter!(id)
    render(conn, "show.html", parameter: parameter)
  end

  def edit(conn, %{"id" => id}) do
    parameter = Core.get_parameter!(id)
    changeset = Core.change_parameter(parameter)
    render(conn, "edit.html", parameter: parameter, changeset: changeset)
  end

  def update(conn, %{"id" => id, "parameter" => parameter_params}) do
    parameter = Core.get_parameter!(id)

    case Core.update_parameter(parameter, parameter_params) do
      {:ok, parameter} ->
        conn
        |> put_flash(:info, "Parameter updated successfully.")
        |> redirect(to: Routes.parameter_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", parameter: parameter, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    parameter = Core.get_parameter!(id)
    {:ok, _parameter} = Core.delete_parameter(parameter)

    conn
    |> put_flash(:info, "Parameter deleted successfully.")
    |> redirect(to: Routes.parameter_path(conn, :index))
  end
end
