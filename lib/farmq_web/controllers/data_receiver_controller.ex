defmodule FarmQWeb.DataReceiverController do
  use FarmQWeb, :controller

  def create(conn, params) do
    {:ok, _} = FarmQ.Core.create_sensor_data(params)
    json(conn, %{})
  end
end
