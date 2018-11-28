defmodule FarmQWeb.SowingDataControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{description: "some description", expected_yield_unit: "some expected_yield_unit", expected_yield_value: "120.5", seed_weight: "120.5", sown_date: ~D[2010-04-17]}
  @update_attrs %{description: "some updated description", expected_yield_unit: "some updated expected_yield_unit", expected_yield_value: "456.7", seed_weight: "456.7", sown_date: ~D[2011-05-18]}
  @invalid_attrs %{description: nil, expected_yield_unit: nil, expected_yield_value: nil, seed_weight: nil, sown_date: nil}

  def fixture(:sowing_data) do
    {:ok, sowing_data} = Core.create_sowing_data(@create_attrs)
    sowing_data
  end

  describe "index" do
    test "lists all sowing_data", %{conn: conn} do
      conn = get(conn, Routes.sowing_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sowing data"
    end
  end

  describe "new sowing_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.sowing_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New Sowing data"
    end
  end

  describe "create sowing_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.sowing_data_path(conn, :create), sowing_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.sowing_data_path(conn, :show, id)

      conn = get(conn, Routes.sowing_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Sowing data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.sowing_data_path(conn, :create), sowing_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sowing data"
    end
  end

  describe "edit sowing_data" do
    setup [:create_sowing_data]

    test "renders form for editing chosen sowing_data", %{conn: conn, sowing_data: sowing_data} do
      conn = get(conn, Routes.sowing_data_path(conn, :edit, sowing_data))
      assert html_response(conn, 200) =~ "Edit Sowing data"
    end
  end

  describe "update sowing_data" do
    setup [:create_sowing_data]

    test "redirects when data is valid", %{conn: conn, sowing_data: sowing_data} do
      conn = put(conn, Routes.sowing_data_path(conn, :update, sowing_data), sowing_data: @update_attrs)
      assert redirected_to(conn) == Routes.sowing_data_path(conn, :show, sowing_data)

      conn = get(conn, Routes.sowing_data_path(conn, :show, sowing_data))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, sowing_data: sowing_data} do
      conn = put(conn, Routes.sowing_data_path(conn, :update, sowing_data), sowing_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sowing data"
    end
  end

  describe "delete sowing_data" do
    setup [:create_sowing_data]

    test "deletes chosen sowing_data", %{conn: conn, sowing_data: sowing_data} do
      conn = delete(conn, Routes.sowing_data_path(conn, :delete, sowing_data))
      assert redirected_to(conn) == Routes.sowing_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.sowing_data_path(conn, :show, sowing_data))
      end
    end
  end

  defp create_sowing_data(_) do
    sowing_data = fixture(:sowing_data)
    {:ok, sowing_data: sowing_data}
  end
end
