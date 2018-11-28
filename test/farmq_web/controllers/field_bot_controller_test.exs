defmodule FarmQWeb.Location.FieldBotControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:field_bot) do
    {:ok, field_bot} = Core.create_field_bot(@create_attrs)
    field_bot
  end

  describe "index" do

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "lists all field_bots", %{conn: conn} do
      conn = get(conn, Routes.location_field_bot_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Field bots"
    end
  end

  describe "new field_bot" do

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.location_field_bot_path(conn, :new))
      assert html_response(conn, 200) =~ "New Field bot"
    end
  end

  describe "create field_bot" do

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.location_field_bot_path(conn, :create), field_bot: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.location_field_bot_path(conn, :show, id)

      conn = get(conn, Routes.location_field_bot_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Field bot"
    end

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.location_field_bot_path(conn, :create), field_bot: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Field bot"
    end
  end

  describe "edit field_bot" do
    setup [:create_field_bot]

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "renders form for editing chosen field_bot", %{conn: conn, field_bot: field_bot} do
      conn = get(conn, Routes.location_field_bot_path(conn, :edit, field_bot))
      assert html_response(conn, 200) =~ "Edit Field bot"
    end
  end

  describe "update field_bot" do
    setup [:create_field_bot]

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "redirects when data is valid", %{conn: conn, field_bot: field_bot} do
      conn = put(conn, Routes.location_field_bot_path(conn, :update, field_bot), field_bot: @update_attrs)
      assert redirected_to(conn) == Routes.location_field_bot_path(conn, :show, field_bot)

      conn = get(conn, Routes.location_field_bot_path(conn, :show, field_bot))
      assert html_response(conn, 200) =~ "some updated name"
    end

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "renders errors when data is invalid", %{conn: conn, field_bot: field_bot} do
      conn = put(conn, Routes.location_field_bot_path(conn, :update, field_bot), field_bot: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Field bot"
    end
  end

  describe "delete field_bot" do
    setup [:create_field_bot]

    @tag skip: "this test is invalid right now, as it is going to be changed"
    test "deletes chosen field_bot", %{conn: conn, field_bot: field_bot} do
      conn = delete(conn, Routes.location_field_bot_path(conn, :delete, field_bot))
      assert redirected_to(conn) == Routes.location_field_bot_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.location_field_bot_path(conn, :show, field_bot))
      end
    end
  end

  defp create_field_bot(_) do
    field_bot = fixture(:field_bot)
    {:ok, field_bot: field_bot}
  end
end
