defmodule FarmQWeb.DocumentController do
  use FarmQWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
