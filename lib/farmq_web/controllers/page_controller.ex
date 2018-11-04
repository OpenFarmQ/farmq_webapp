defmodule FarmQWeb.PageController do
  use FarmQWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get_started(conn, _params) do
    render conn, "get_started.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end
end
