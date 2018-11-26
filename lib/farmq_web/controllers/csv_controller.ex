defmodule FarmQWeb.CsvController do
  use FarmQWeb, :controller
  alias FarmQ.Core
  alias NimbleCSV.RFC4180, as: CSV


  def download_prep_data(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"prep_data.csv\"")
    |> send_resp(200, prep_data(Core.get_crop_cycle!(id)))
  end

  def download_sowing_data(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"sowing_data.csv\"")
    |> send_resp(200, sowing_data(Core.get_crop_cycle!(id)))
  end

  def download_harvest_data(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"harvest_data.csv\"")
    |> send_resp(200, harvest_data(Core.get_crop_cycle!(id)))
  end

  def download_clearation_data(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"clearation_data.csv\"")
    |> send_resp(200, clearation_data(Core.get_crop_cycle!(id)))
  end

  def download_sensor_data(conn, %{"id" => id}) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"sensor_data.csv\"")
    |> send_resp(200, sensor_data(Core.get_crop_cycle!(id)))
  end

  # Private functions

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
