defmodule FarmQ.CoreTest do
  use FarmQ.DataCase

  alias FarmQ.Core

  describe "parameters" do
    alias FarmQ.Core.Parameter

    @valid_attrs %{data_type: "some data_type", description: "some description", key: "some key", name: "some name", unit: "some unit"}
    @update_attrs %{data_type: "some updated data_type", description: "some updated description", key: "some updated key", name: "some updated name", unit: "some updated unit"}
    @invalid_attrs %{data_type: nil, description: nil, key: nil, name: nil, unit: nil}

    def parameter_fixture(attrs \\ %{}) do
      {:ok, parameter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_parameter()

      parameter
    end

    test "list_parameters/0 returns all parameters" do
      parameter = parameter_fixture()
      assert Core.list_parameters() == [parameter]
    end

    test "get_parameter!/1 returns the parameter with given id" do
      parameter = parameter_fixture()
      assert Core.get_parameter!(parameter.id) == parameter
    end

    test "create_parameter/1 with valid data creates a parameter" do
      assert {:ok, %Parameter{} = parameter} = Core.create_parameter(@valid_attrs)
      assert parameter.data_type == "some data_type"
      assert parameter.description == "some description"
      assert parameter.key == "some key"
      assert parameter.name == "some name"
      assert parameter.unit == "some unit"
    end

    test "create_parameter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_parameter(@invalid_attrs)
    end

    test "update_parameter/2 with valid data updates the parameter" do
      parameter = parameter_fixture()
      assert {:ok, %Parameter{} = parameter} = Core.update_parameter(parameter, @update_attrs)


      assert parameter.data_type == "some updated data_type"
      assert parameter.description == "some updated description"
      assert parameter.key == "some updated key"
      assert parameter.name == "some updated name"
      assert parameter.unit == "some updated unit"
    end

    test "update_parameter/2 with invalid data returns error changeset" do
      parameter = parameter_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_parameter(parameter, @invalid_attrs)
      assert parameter == Core.get_parameter!(parameter.id)
    end

    test "delete_parameter/1 deletes the parameter" do
      parameter = parameter_fixture()
      assert {:ok, %Parameter{}} = Core.delete_parameter(parameter)
      assert_raise Ecto.NoResultsError, fn -> Core.get_parameter!(parameter.id) end
    end

    test "change_parameter/1 returns a parameter changeset" do
      parameter = parameter_fixture()
      assert %Ecto.Changeset{} = Core.change_parameter(parameter)
    end
  end

  describe "plants" do
    alias FarmQ.Core.Plant

    @valid_attrs %{binomial_name: "some binomial_name", common_name: [], data_scrapper_id: "some data_scrapper_id", description: "some description", image: "some image", name: "some name", source_name: "some source_name", source_url: "some source_url"}
    @update_attrs %{binomial_name: "some updated binomial_name", common_name: [], data_scrapper_id: "some updated data_scrapper_id", description: "some updated description", image: "some updated image", name: "some updated name", source_name: "some updated source_name", source_url: "some updated source_url"}
    @invalid_attrs %{binomial_name: nil, common_name: nil, data_scrapper_id: nil, description: nil, image: nil, name: nil, source_name: nil, source_url: nil}

    def plant_fixture(attrs \\ %{}) do
      {:ok, plant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_plant()

      plant
    end

    test "list_plants/0 returns all plants" do
      plant = plant_fixture()
      assert Core.list_plants() == [plant]
    end

    test "get_plant!/1 returns the plant with given id" do
      plant = plant_fixture()
      assert Core.get_plant!(plant.id) == plant
    end

    test "create_plant/1 with valid data creates a plant" do
      assert {:ok, %Plant{} = plant} = Core.create_plant(@valid_attrs)
      assert plant.binomial_name == "some binomial_name"
      assert plant.common_name == []
      assert plant.data_scrapper_id == "some data_scrapper_id"
      assert plant.description == "some description"
      assert plant.image == "some image"
      assert plant.name == "some name"
      assert plant.source_name == "some source_name"
      assert plant.source_url == "some source_url"
    end

    test "create_plant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_plant(@invalid_attrs)
    end

    test "update_plant/2 with valid data updates the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{} = plant} = Core.update_plant(plant, @update_attrs)


      assert plant.binomial_name == "some updated binomial_name"
      assert plant.common_name == []
      assert plant.data_scrapper_id == "some updated data_scrapper_id"
      assert plant.description == "some updated description"
      assert plant.image == "some updated image"
      assert plant.name == "some updated name"
      assert plant.source_name == "some updated source_name"
      assert plant.source_url == "some updated source_url"
    end

    test "update_plant/2 with invalid data returns error changeset" do
      plant = plant_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_plant(plant, @invalid_attrs)
      assert plant == Core.get_plant!(plant.id)
    end

    test "delete_plant/1 deletes the plant" do
      plant = plant_fixture()
      assert {:ok, %Plant{}} = Core.delete_plant(plant)
      assert_raise Ecto.NoResultsError, fn -> Core.get_plant!(plant.id) end
    end

    test "change_plant/1 returns a plant changeset" do
      plant = plant_fixture()
      assert %Ecto.Changeset{} = Core.change_plant(plant)
    end
  end

  describe "field_bots" do
    alias FarmQ.Core.FieldBot

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def field_bot_fixture(attrs \\ %{}) do
      {:ok, field_bot} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_field_bot()

      field_bot
    end

    test "list_field_bots/0 returns all field_bots" do
      field_bot = field_bot_fixture()
      assert Core.list_field_bots() == [field_bot]
    end

    test "get_field_bot!/1 returns the field_bot with given id" do
      field_bot = field_bot_fixture()
      assert Core.get_field_bot!(field_bot.id) == field_bot
    end

    test "create_field_bot/1 with valid data creates a field_bot" do
      assert {:ok, %FieldBot{} = field_bot} = Core.create_field_bot(@valid_attrs)
      assert field_bot.name == "some name"
    end

    test "create_field_bot/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_field_bot(@invalid_attrs)
    end

    test "update_field_bot/2 with valid data updates the field_bot" do
      field_bot = field_bot_fixture()
      assert {:ok, %FieldBot{} = field_bot} = Core.update_field_bot(field_bot, @update_attrs)


      assert field_bot.name == "some updated name"
    end

    test "update_field_bot/2 with invalid data returns error changeset" do
      field_bot = field_bot_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_field_bot(field_bot, @invalid_attrs)
      assert field_bot == Core.get_field_bot!(field_bot.id)
    end

    test "delete_field_bot/1 deletes the field_bot" do
      field_bot = field_bot_fixture()
      assert {:ok, %FieldBot{}} = Core.delete_field_bot(field_bot)
      assert_raise Ecto.NoResultsError, fn -> Core.get_field_bot!(field_bot.id) end
    end

    test "change_field_bot/1 returns a field_bot changeset" do
      field_bot = field_bot_fixture()
      assert %Ecto.Changeset{} = Core.change_field_bot(field_bot)
    end
  end

  describe "locations" do
    alias FarmQ.Core.Location

    @valid_attrs %{area: "120.5", description: "some description", latitude: "120.5", longitude: "120.5", name: "some name", type: "some type"}
    @update_attrs %{area: "456.7", description: "some updated description", latitude: "456.7", longitude: "456.7", name: "some updated name", type: "some updated type"}
    @invalid_attrs %{area: nil, description: nil, latitude: nil, longitude: nil, name: nil, type: nil}

    def location_fixture(attrs \\ %{}) do
      {:ok, location} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_location()

      location
    end

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Core.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Core.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      assert {:ok, %Location{} = location} = Core.create_location(@valid_attrs)
      assert location.area == Decimal.new("120.5")
      assert location.description == "some description"
      assert location.latitude == Decimal.new("120.5")
      assert location.longitude == Decimal.new("120.5")
      assert location.name == "some name"
      assert location.type == "some type"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      assert {:ok, %Location{} = location} = Core.update_location(location, @update_attrs)

      
      assert location.area == Decimal.new("456.7")
      assert location.description == "some updated description"
      assert location.latitude == Decimal.new("456.7")
      assert location.longitude == Decimal.new("456.7")
      assert location.name == "some updated name"
      assert location.type == "some updated type"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_location(location, @invalid_attrs)
      assert location == Core.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Core.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Core.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Core.change_location(location)
    end
  end
end
