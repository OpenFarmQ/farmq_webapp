defmodule FarmQWeb.HarvestDataControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{actual_yield_unityield_quality: "some actual_yield_unityield_quality", actual_yield_value: "120.5", description: "some description", harvest_date: ~D[2010-04-17]}
  @update_attrs %{actual_yield_unityield_quality: "some updated actual_yield_unityield_quality", actual_yield_value: "456.7", description: "some updated description", harvest_date: ~D[2011-05-18]}
  @invalid_attrs %{actual_yield_unityield_quality: nil, actual_yield_value: nil, description: nil, harvest_date: nil}

  def fixture(:harvest_data) do
    {:ok, harvest_data} = Core.create_harvest_data(@create_attrs)
    harvest_data
  end

  describe "index" do
    test "lists all harvest_data", %{conn: conn} do
      conn = get(conn, Routes.harvest_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Harvest data"
    end
  end

  describe "new harvest_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.harvest_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New Harvest data"
    end
  end

  describe "create harvest_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.harvest_data_path(conn, :create), harvest_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.harvest_data_path(conn, :show, id)

      conn = get(conn, Routes.harvest_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Harvest data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.harvest_data_path(conn, :create), harvest_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Harvest data"
    end
  end

  describe "edit harvest_data" do
    setup [:create_harvest_data]

    test "renders form for editing chosen harvest_data", %{conn: conn, harvest_data: harvest_data} do
      conn = get(conn, Routes.harvest_data_path(conn, :edit, harvest_data))
      assert html_response(conn, 200) =~ "Edit Harvest data"
    end
  end

  describe "update harvest_data" do
    setup [:create_harvest_data]

    test "redirects when data is valid", %{conn: conn, harvest_data: harvest_data} do
      conn = put(conn, Routes.harvest_data_path(conn, :update, harvest_data), harvest_data: @update_attrs)
      assert redirected_to(conn) == Routes.harvest_data_path(conn, :show, harvest_data)

      conn = get(conn, Routes.harvest_data_path(conn, :show, harvest_data))
      assert html_response(conn, 200) =~ "some updated actual_yield_unityield_quality"
    end

    test "renders errors when data is invalid", %{conn: conn, harvest_data: harvest_data} do
      conn = put(conn, Routes.harvest_data_path(conn, :update, harvest_data), harvest_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Harvest data"
    end
  end

  describe "delete harvest_data" do
    setup [:create_harvest_data]

    test "deletes chosen harvest_data", %{conn: conn, harvest_data: harvest_data} do
      conn = delete(conn, Routes.harvest_data_path(conn, :delete, harvest_data))
      assert redirected_to(conn) == Routes.harvest_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.harvest_data_path(conn, :show, harvest_data))
      end
    end
  end

  defp create_harvest_data(_) do
    harvest_data = fixture(:harvest_data)
    {:ok, harvest_data: harvest_data}
  end
end
