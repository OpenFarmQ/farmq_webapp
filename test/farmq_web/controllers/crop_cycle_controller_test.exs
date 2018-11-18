defmodule FarmQWeb.CropCycleControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:crop_cycle) do
    {:ok, crop_cycle} = Core.create_crop_cycle(@create_attrs)
    crop_cycle
  end

  describe "index" do
    test "lists all crop_cycles", %{conn: conn} do
      conn = get(conn, Routes.crop_cycle_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Crop cycles"
    end
  end

  describe "new crop_cycle" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.crop_cycle_path(conn, :new))
      assert html_response(conn, 200) =~ "New Crop cycle"
    end
  end

  describe "create crop_cycle" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.crop_cycle_path(conn, :create), crop_cycle: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.crop_cycle_path(conn, :show, id)

      conn = get(conn, Routes.crop_cycle_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Crop cycle"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.crop_cycle_path(conn, :create), crop_cycle: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Crop cycle"
    end
  end

  describe "edit crop_cycle" do
    setup [:create_crop_cycle]

    test "renders form for editing chosen crop_cycle", %{conn: conn, crop_cycle: crop_cycle} do
      conn = get(conn, Routes.crop_cycle_path(conn, :edit, crop_cycle))
      assert html_response(conn, 200) =~ "Edit Crop cycle"
    end
  end

  describe "update crop_cycle" do
    setup [:create_crop_cycle]

    test "redirects when data is valid", %{conn: conn, crop_cycle: crop_cycle} do
      conn = put(conn, Routes.crop_cycle_path(conn, :update, crop_cycle), crop_cycle: @update_attrs)
      assert redirected_to(conn) == Routes.crop_cycle_path(conn, :show, crop_cycle)

      conn = get(conn, Routes.crop_cycle_path(conn, :show, crop_cycle))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, crop_cycle: crop_cycle} do
      conn = put(conn, Routes.crop_cycle_path(conn, :update, crop_cycle), crop_cycle: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Crop cycle"
    end
  end

  describe "delete crop_cycle" do
    setup [:create_crop_cycle]

    test "deletes chosen crop_cycle", %{conn: conn, crop_cycle: crop_cycle} do
      conn = delete(conn, Routes.crop_cycle_path(conn, :delete, crop_cycle))
      assert redirected_to(conn) == Routes.crop_cycle_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.crop_cycle_path(conn, :show, crop_cycle))
      end
    end
  end

  defp create_crop_cycle(_) do
    crop_cycle = fixture(:crop_cycle)
    {:ok, crop_cycle: crop_cycle}
  end
end
