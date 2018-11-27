defmodule FarmQWeb.CsvController do
  use FarmQWeb, :controller
  alias FarmQ.Core
  alias NimbleCSV.RFC4180, as: CSV


  def download_prep_data(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"#{dynamic_name(crop_cycle, "prep_data")}\"")
    |> send_resp(200, prep_data(crop_cycle))
  end

  def download_sowing_data(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"#{dynamic_name(crop_cycle, "sowing_data")}\"")
    |> send_resp(200, sowing_data(crop_cycle))
  end

  def download_harvest_data(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"#{dynamic_name(crop_cycle, "harvest_data")}\"")
    |> send_resp(200, harvest_data(crop_cycle))
  end

  def download_clearation_data(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"#{dynamic_name(crop_cycle, "clearation_data")}\"")
    |> send_resp(200, clearation_data(crop_cycle))
  end

  def download_sensor_data(conn, %{"id" => id}) do
    crop_cycle = Core.get_crop_cycle!(id)
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"#{dynamic_name(crop_cycle, "sensor_data")}\"")
    |> send_resp(200, sensor_data(crop_cycle))
  end


  # Private function to dynamic CSV file name

  defp dynamic_name(crop_cycle, type_of_data) do
    crop_cycle_name = crop_cycle.name |> String.split |> Enum.join("_")
    case type_of_data do
      "prep_data" ->
        "#{crop_cycle_name}_prep_data.csv"

      "sowing_data" ->
        "#{crop_cycle_name}_sowing_data.csv"

      "harvest_data" ->
        "#{crop_cycle_name}_harvest_data.csv"

      "clearation_data" ->
        "#{crop_cycle_name}_clearation_data.csv"

      "sensor_data" ->
        "#{crop_cycle_name}_sensor_data.csv"
    end
  end

  # Private functions to convert the structs into CSV

  defp prep_data(crop_cycle) do
  CSV.dump_to_iodata(Core.list_field_preparation_data(crop_cycle) |> Enum.map(fn(f) -> [f.id, f.description, f.preparation_date] end))
  |> IO.iodata_to_binary
  end

  defp sowing_data(crop_cycle) do
  CSV.dump_to_iodata(Core.list_sowing_data(crop_cycle) |> Enum.map(fn(f) -> [f.id, f.plant.name, f.seed_weight, f.expected_yield_value, f.expected_yield_unit, f.sown_date] end))
  |> IO.iodata_to_binary
  end

  defp harvest_data(crop_cycle) do
  CSV.dump_to_iodata(Core.list_harvest_data(crop_cycle) |> Enum.map(fn(f) -> [f.id, f.actual_yield_value, f.actual_yield_unit, f.description, f.yield_quality, f.harvest_date] end))
  |> IO.iodata_to_binary
  end

  defp clearation_data(crop_cycle) do
  CSV.dump_to_iodata(Core.list_field_clearation_data(crop_cycle) |> Enum.map(fn(f) -> [f.id, f.description, f.clearation_date] end))
  |> IO.iodata_to_binary
  end

  defp sensor_data(crop_cycle) do
  CSV.dump_to_iodata(Core.list_sensor_data_by_crop_cycle(crop_cycle) |> Enum.map(fn(f) -> [f.id, f.parameter.name, f.value, f.collected_time, f.bed.name] end))
  |> IO.iodata_to_binary
  end

end
