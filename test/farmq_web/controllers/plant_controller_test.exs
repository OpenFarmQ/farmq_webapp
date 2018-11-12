defmodule FarmQWeb.PlantControllerTest do
  use FarmQWeb.ConnCase

  alias FarmQ.Core

  @create_attrs %{binomial_name: "some binomial_name", common_name: [], data_scrapper_id: "some data_scrapper_id", description: "some description", image: "some image", name: "some name", source_name: "some source_name", source_url: "some source_url"}
  @update_attrs %{binomial_name: "some updated binomial_name", common_name: [], data_scrapper_id: "some updated data_scrapper_id", description: "some updated description", image: "some updated image", name: "some updated name", source_name: "some updated source_name", source_url: "some updated source_url"}
  @invalid_attrs %{binomial_name: nil, common_name: nil, data_scrapper_id: nil, description: nil, image: nil, name: nil, source_name: nil, source_url: nil}

  def fixture(:plant) do
    {:ok, plant} = Core.create_plant(@create_attrs)
    plant
  end

  describe "index" do
    test "lists all plants", %{conn: conn} do
      conn = get(conn, Routes.plant_path(conn, :index))
      assert html_response(conn, 200) =~ "Plants"
    end
  end

  describe "new plant" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.plant_path(conn, :new))
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "create plant" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.plant_path(conn, :create), plant: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.plant_path(conn, :show, id)

      conn = get(conn, Routes.plant_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Plant"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.plant_path(conn, :create), plant: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Plant"
    end
  end

  describe "edit plant" do
    setup [:create_plant]

    test "renders form for editing chosen plant", %{conn: conn, plant: plant} do
      conn = get(conn, Routes.plant_path(conn, :edit, plant))
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "update plant" do
    setup [:create_plant]

    test "redirects when data is valid", %{conn: conn, plant: plant} do
      conn = put(conn, Routes.plant_path(conn, :update, plant), plant: @update_attrs)
      assert redirected_to(conn) == Routes.plant_path(conn, :show, plant)

      conn = get(conn, Routes.plant_path(conn, :show, plant))
      assert html_response(conn, 200) =~ "some updated binomial_name"
    end

    test "renders errors when data is invalid", %{conn: conn, plant: plant} do
      conn = put(conn, Routes.plant_path(conn, :update, plant), plant: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Plant"
    end
  end

  describe "delete plant" do
    setup [:create_plant]

    test "deletes chosen plant", %{conn: conn, plant: plant} do
      conn = delete(conn, Routes.plant_path(conn, :delete, plant))
      assert redirected_to(conn) == Routes.plant_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.plant_path(conn, :show, plant))
      end
    end
  end

  defp create_plant(_) do
    plant = fixture(:plant)
    {:ok, plant: plant}
  end
end
