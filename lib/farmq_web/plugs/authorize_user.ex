defmodule FarmQWeb.Plugs.AuthorizeUser do
  alias Plug.Conn
  import Phoenix.Controller, only: [redirect: 2, put_flash: 3]

  def init(_opts) do
    nil
  end

  def call(%Conn{} = conn, _opts) do
    case conn.assigns[:current_user] do
      nil ->
        conn
        |> put_flash(:info, "You must be signed in to continue")
        |> redirect(to: "/login")

      _ ->
        conn
    end
  end
end
