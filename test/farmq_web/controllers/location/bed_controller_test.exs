defmodule FarmQWeb.Location.BedControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{area: "120.5", name: "some name", status: "some status"}
  @update_attrs %{area: "456.7", name: "some updated name", status: "some updated status"}
  @invalid_attrs %{area: nil, name: nil, status: nil}

  def fixture(:bed) do
    {:ok, bed} = Core.create_bed(@create_attrs)
    bed
  end

  describe "index" do
    test "lists all beds", %{conn: conn} do
      conn = get(conn, Routes.location_bed_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Beds"
    end
  end

  describe "new bed" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.location_bed_path(conn, :new))
      assert html_response(conn, 200) =~ "New Bed"
    end
  end

  describe "create bed" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.location_bed_path(conn, :create), bed: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.location_bed_path(conn, :show, id)

      conn = get(conn, Routes.location_bed_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Bed"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.location_bed_path(conn, :create), bed: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bed"
    end
  end

  describe "edit bed" do
    setup [:create_bed]

    test "renders form for editing chosen bed", %{conn: conn, bed: bed} do
      conn = get(conn, Routes.location_bed_path(conn, :edit, bed))
      assert html_response(conn, 200) =~ "Edit Bed"
    end
  end

  describe "update bed" do
    setup [:create_bed]

    test "redirects when data is valid", %{conn: conn, bed: bed} do
      conn = put(conn, Routes.location_bed_path(conn, :update, bed), bed: @update_attrs)
      assert redirected_to(conn) == Routes.location_bed_path(conn, :show, bed)

      conn = get(conn, Routes.location_bed_path(conn, :show, bed))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, bed: bed} do
      conn = put(conn, Routes.location_bed_path(conn, :update, bed), bed: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bed"
    end
  end

  describe "delete bed" do
    setup [:create_bed]

    test "deletes chosen bed", %{conn: conn, bed: bed} do
      conn = delete(conn, Routes.location_bed_path(conn, :delete, bed))
      assert redirected_to(conn) == Routes.location_bed_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.location_bed_path(conn, :show, bed))
      end
    end
  end

  defp create_bed(_) do
    bed = fixture(:bed)
    {:ok, bed: bed}
  end
end
