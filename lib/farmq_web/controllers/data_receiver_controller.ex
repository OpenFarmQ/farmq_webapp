defmodule FarmQWeb.DataReceiverController do
  use FarmQWeb, :controller
  alias FarmQ.Core

  def create(conn, params) do
    parameter = Core.get_parameter_by_key(params["key"])
    value = params["value"]
    bed_id = params["bed_id"] 
    {:ok, sensor_data} = Core.create_sensor_data(%{parameter_id: parameter.id, value: value, location_id: "bed_id"})
    json(conn, %{})
  end
end
