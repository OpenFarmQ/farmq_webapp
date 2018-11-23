defmodule FarmQWeb.SessionController do
  use FarmQWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end
end
