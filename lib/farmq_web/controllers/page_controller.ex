defmodule FarmQWeb.PageController do
  use FarmQWeb, :controller
  alias FarmQ.Core

  def farmq_insight(conn, _params) do
    locations = Core.list_locations()
    render(conn, "farmq_insight.html", locations: locations)
  end

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def get_started(conn, _params) do
    render conn, "get_started.html"
  end

  def contact(conn, _params) do
    render conn, "contact.html"
  end

  def contributor(conn, _params) do
    render conn, "contributor_non_signed.html"
  end
end
