defmodule FarmQWeb.FieldPreparationDataControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{description: "some description", preparation_date: ~D[2010-04-17]}
  @update_attrs %{description: "some updated description", preparation_date: ~D[2011-05-18]}
  @invalid_attrs %{description: nil, preparation_date: nil}

  def fixture(:field_preparation_data) do
    {:ok, field_preparation_data} = Core.create_field_preparation_data(@create_attrs)
    field_preparation_data
  end

  describe "index" do
    test "lists all field_preparation_data", %{conn: conn} do
      conn = get(conn, Routes.field_preparation_data_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Field preparation data"
    end
  end

  describe "new field_preparation_data" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.field_preparation_data_path(conn, :new))
      assert html_response(conn, 200) =~ "New Field preparation data"
    end
  end

  describe "create field_preparation_data" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.field_preparation_data_path(conn, :create), field_preparation_data: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.field_preparation_data_path(conn, :show, id)

      conn = get(conn, Routes.field_preparation_data_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Field preparation data"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.field_preparation_data_path(conn, :create), field_preparation_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Field preparation data"
    end
  end

  describe "edit field_preparation_data" do
    setup [:create_field_preparation_data]

    test "renders form for editing chosen field_preparation_data", %{conn: conn, field_preparation_data: field_preparation_data} do
      conn = get(conn, Routes.field_preparation_data_path(conn, :edit, field_preparation_data))
      assert html_response(conn, 200) =~ "Edit Field preparation data"
    end
  end

  describe "update field_preparation_data" do
    setup [:create_field_preparation_data]

    test "redirects when data is valid", %{conn: conn, field_preparation_data: field_preparation_data} do
      conn = put(conn, Routes.field_preparation_data_path(conn, :update, field_preparation_data), field_preparation_data: @update_attrs)
      assert redirected_to(conn) == Routes.field_preparation_data_path(conn, :show, field_preparation_data)

      conn = get(conn, Routes.field_preparation_data_path(conn, :show, field_preparation_data))
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, field_preparation_data: field_preparation_data} do
      conn = put(conn, Routes.field_preparation_data_path(conn, :update, field_preparation_data), field_preparation_data: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Field preparation data"
    end
  end

  describe "delete field_preparation_data" do
    setup [:create_field_preparation_data]

    test "deletes chosen field_preparation_data", %{conn: conn, field_preparation_data: field_preparation_data} do
      conn = delete(conn, Routes.field_preparation_data_path(conn, :delete, field_preparation_data))
      assert redirected_to(conn) == Routes.field_preparation_data_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.field_preparation_data_path(conn, :show, field_preparation_data))
      end
    end
  end

  defp create_field_preparation_data(_) do
    field_preparation_data = fixture(:field_preparation_data)
    {:ok, field_preparation_data: field_preparation_data}
  end
end
