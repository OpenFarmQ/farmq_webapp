defmodule FarmQWeb.FieldBotController do
  use FarmQWeb, :controller

  alias FarmQ.Core
  alias FarmQ.Core.FieldBot

  def index(conn, _params) do
    field_bots = Core.list_field_bots()
    render(conn, "index.html", field_bots: field_bots)
  end

  def new(conn, _params) do
    beds = Core.list_locations("Bed")
    changeset = Core.change_field_bot(%FieldBot{})
    render(conn, "new.html", changeset: changeset, beds: beds)
  end

  def create(conn, %{"field_bot" => field_bot_params}) do
    case Core.create_field_bot(field_bot_params) do
      {:ok, field_bot} ->
        conn
        |> put_flash(:info, "Field bot created successfully.")
        |> redirect(to: Routes.field_bot_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    field_bot = Core.get_field_bot!(id)
    render(conn, "show.html", field_bot: field_bot)
  end

  def edit(conn, %{"id" => id}) do
    field_bot = Core.get_field_bot!(id)
    beds = Core.list_locations("Bed")
    changeset = Core.change_field_bot(field_bot)
    render(conn, "edit.html", beds: beds, field_bot: field_bot, changeset: changeset)
  end

  def update(conn, %{"id" => id, "field_bot" => field_bot_params}) do

    field_bot = Core.get_field_bot!(id)

    case Core.update_field_bot(field_bot, field_bot_params) do
      {:ok, field_bot} ->
        conn
        |> put_flash(:info, "Field bot updated successfully.")
        |> redirect(to: Routes.field_bot_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", field_bot: field_bot, changeset: changeset)
    end
  end


  def delete(conn, %{"id" => id}) do

    field_bot = Core.get_field_bot!(id)
    {:ok, _field_bot} = Core.delete_field_bot(field_bot)

    conn
    |> put_flash(:info, "Field bot deleted successfully.")
    |> redirect(to: Routes.field_bot_path(conn, :index))
  end
end
