defmodule FarmQWeb.DataReceiverController do
  use FarmQWeb, :controller

  def create(conn, params) do
    json(conn, %{"data" => params["temparature"]})
  end
end
