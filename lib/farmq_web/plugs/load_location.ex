defmodule FarmQWeb.Plug.LoadLocation do
  import Plug.Conn
  alias FarmQ.Core

  def init(_params) do
    nil
  end

  def call(conn, _params) do
    location_id = conn.params["location_id"]
    location = Core.get_location!(location_id)

    assign(conn, :location, location)
  end
end
