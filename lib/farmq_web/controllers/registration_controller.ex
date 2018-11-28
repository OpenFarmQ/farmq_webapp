defmodule FarmQWeb.RegistrationController do
  use FarmQWeb, :controller
  alias FarmQ.Core

  def new(conn, _params) do
    changeset = Core.build_user()
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"registration" => registration_params}) do
    case Core.create_user(registration_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "You are now officialy part of FarmQ community, sign in to continue")
        |> redirect(to: Routes.page_path(conn, :contributor))
      {:error, changeset} ->
        conn
        |> render(:new, changeset: changeset)
    end
  end
end
