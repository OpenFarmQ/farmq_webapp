defmodule FarmQWeb.CsvController do
  use FarmQWeb, :controller
  alias FarmQ.Core
  alias NimbleCSV.RFC4180, as: CSV


  def export(conn, _params) do
    conn
    |> put_resp_content_type("text/csv")
    |> put_resp_header("content-disposition", "attachment; filename=\"crop_cycle.csv\"")
    |> send_resp(200, csv_content)
  end

  defp csv_content do
  CSV.dump_to_iodata(Core.list_crop_cycles |> Enum.map(fn(f) -> [f.id, f.name] end))
  |> IO.iodata_to_binary
  end

end
