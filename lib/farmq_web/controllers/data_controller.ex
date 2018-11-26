defmodule FarmQWeb.DataController do
  use FarmQWeb, :controller
  alias FarmQ.Core

  def index(conn, _params) do
    crop_cycles = Core.list_crop_cycles
    render(conn, "index.html", crop_cycles: crop_cycles)
  end
end
