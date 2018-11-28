defmodule FarmQWeb.FieldClearationDataControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{clearation_date: ~D[2010-04-17], description: "some description"}
  @update_attrs %{clearation_date: ~D[2011-05-18], description: "some updated description"}
  @invalid_attrs %{clearation_date: nil, description: nil}

  def fixture(:field_clearation_data) do
    {:ok, field_clearation_data} = Core.create_field_clearation_data(@create_attrs)
    field_clearation_data
  end

  describe "index" do
    test "lists all field_clearation_data", %{conn: conn} do
      conn = get(conn, Routes.field_clearation_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Field clearation data"
    end
  end

  describe "new field_clearation_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.field_clearation_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New Field clearation data"
    end
  end

  describe "create field_clearation_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.field_clearation_data_path(conn, :create), field_clearation_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.field_clearation_data_path(conn, :show, id)

      conn = get(conn, Routes.field_clearation_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Field clearation data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.field_clearation_data_path(conn, :create), field_clearation_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Field clearation data"
    end
  end

  describe "edit field_clearation_data" do
    setup [:create_field_clearation_data]

    test "renders form for editing chosen field_clearation_data", %{conn: conn, field_clearation_data: field_clearation_data} do
      conn = get(conn, Routes.field_clearation_data_path(conn, :edit, field_clearation_data))
      assert html_response(conn, 200) =~ "Edit Field clearation data"
    end
  end

  describe "update field_clearation_data" do
    setup [:create_field_clearation_data]

    test "redirects when data is valid", %{conn: conn, field_clearation_data: field_clearation_data} do
      conn = put(conn, Routes.field_clearation_data_path(conn, :update, field_clearation_data), field_clearation_data: @update_attrs)
      assert redirected_to(conn) == Routes.field_clearation_data_path(conn, :show, field_clearation_data)

      conn = get(conn, Routes.field_clearation_data_path(conn, :show, field_clearation_data))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, field_clearation_data: field_clearation_data} do
      conn = put(conn, Routes.field_clearation_data_path(conn, :update, field_clearation_data), field_clearation_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Field clearation data"
    end
  end

  describe "delete field_clearation_data" do
    setup [:create_field_clearation_data]

    test "deletes chosen field_clearation_data", %{conn: conn, field_clearation_data: field_clearation_data} do
      conn = delete(conn, Routes.field_clearation_data_path(conn, :delete, field_clearation_data))
      assert redirected_to(conn) == Routes.field_clearation_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.field_clearation_data_path(conn, :show, field_clearation_data))
      end
    end
  end

  defp create_field_clearation_data(_) do
    field_clearation_data = fixture(:field_clearation_data)
    {:ok, field_clearation_data: field_clearation_data}
  end
end
