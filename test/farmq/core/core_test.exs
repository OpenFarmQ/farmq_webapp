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

  describe "sensors" do
    alias FarmQ.Core.Sensor

    @valid_attrs %{description: "some description", name: "some name", url: "some url"}
    @update_attrs %{description: "some updated description", name: "some updated name", url: "some updated url"}
    @invalid_attrs %{description: nil, name: nil, url: nil}

    def sensor_fixture(attrs \\ %{}) do
      {:ok, sensor} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_sensor()

      sensor
    end

    test "list_sensors/0 returns all sensors" do
      sensor = sensor_fixture()
      assert Core.list_sensors() == [sensor]
    end

    test "get_sensor!/1 returns the sensor with given id" do
      sensor = sensor_fixture()
      assert Core.get_sensor!(sensor.id) == sensor
    end

    test "create_sensor/1 with valid data creates a sensor" do
      assert {:ok, %Sensor{} = sensor} = Core.create_sensor(@valid_attrs)
      assert sensor.description == "some description"
      assert sensor.name == "some name"
      assert sensor.url == "some url"
    end

    test "create_sensor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_sensor(@invalid_attrs)
    end

    test "update_sensor/2 with valid data updates the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{} = sensor} = Core.update_sensor(sensor, @update_attrs)


      assert sensor.description == "some updated description"
      assert sensor.name == "some updated name"
      assert sensor.url == "some updated url"
    end

    test "update_sensor/2 with invalid data returns error changeset" do
      sensor = sensor_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_sensor(sensor, @invalid_attrs)
      assert sensor == Core.get_sensor!(sensor.id)
    end

    test "delete_sensor/1 deletes the sensor" do
      sensor = sensor_fixture()
      assert {:ok, %Sensor{}} = Core.delete_sensor(sensor)
      assert_raise Ecto.NoResultsError, fn -> Core.get_sensor!(sensor.id) end
    end

    test "change_sensor/1 returns a sensor changeset" do
      sensor = sensor_fixture()
      assert %Ecto.Changeset{} = Core.change_sensor(sensor)
    end
  end

  describe "crop_cycles" do
    alias FarmQ.Core.CropCycle

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def crop_cycle_fixture(attrs \\ %{}) do
      {:ok, crop_cycle} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_crop_cycle()

      crop_cycle
    end

    test "list_crop_cycles/0 returns all crop_cycles" do
      crop_cycle = crop_cycle_fixture()
      assert Core.list_crop_cycles() == [crop_cycle]
    end

    test "get_crop_cycle!/1 returns the crop_cycle with given id" do
      crop_cycle = crop_cycle_fixture()
      assert Core.get_crop_cycle!(crop_cycle.id) == crop_cycle
    end

    test "create_crop_cycle/1 with valid data creates a crop_cycle" do
      assert {:ok, %CropCycle{} = crop_cycle} = Core.create_crop_cycle(@valid_attrs)
      assert crop_cycle.name == "some name"
    end

    test "create_crop_cycle/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_crop_cycle(@invalid_attrs)
    end

    test "update_crop_cycle/2 with valid data updates the crop_cycle" do
      crop_cycle = crop_cycle_fixture()
      assert {:ok, %CropCycle{} = crop_cycle} = Core.update_crop_cycle(crop_cycle, @update_attrs)


      assert crop_cycle.name == "some updated name"
    end

    test "update_crop_cycle/2 with invalid data returns error changeset" do
      crop_cycle = crop_cycle_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_crop_cycle(crop_cycle, @invalid_attrs)
      assert crop_cycle == Core.get_crop_cycle!(crop_cycle.id)
    end

    test "delete_crop_cycle/1 deletes the crop_cycle" do
      crop_cycle = crop_cycle_fixture()
      assert {:ok, %CropCycle{}} = Core.delete_crop_cycle(crop_cycle)
      assert_raise Ecto.NoResultsError, fn -> Core.get_crop_cycle!(crop_cycle.id) end
    end

    test "change_crop_cycle/1 returns a crop_cycle changeset" do
      crop_cycle = crop_cycle_fixture()
      assert %Ecto.Changeset{} = Core.change_crop_cycle(crop_cycle)
    end
  end

  describe "field_preparation_data" do
    alias FarmQ.Core.FieldPreparationData

    @valid_attrs %{description: "some description", preparation_date: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", preparation_date: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, preparation_date: nil}

    def field_preparation_data_fixture(attrs \\ %{}) do
      {:ok, field_preparation_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_field_preparation_data()

      field_preparation_data
    end

    test "list_field_preparation_data/0 returns all field_preparation_data" do
      field_preparation_data = field_preparation_data_fixture()
      assert Core.list_field_preparation_data() == [field_preparation_data]
    end

    test "get_field_preparation_data!/1 returns the field_preparation_data with given id" do
      field_preparation_data = field_preparation_data_fixture()
      assert Core.get_field_preparation_data!(field_preparation_data.id) == field_preparation_data
    end

    test "create_field_preparation_data/1 with valid data creates a field_preparation_data" do
      assert {:ok, %FieldPreparationData{} = field_preparation_data} = Core.create_field_preparation_data(@valid_attrs)
      assert field_preparation_data.description == "some description"
      assert field_preparation_data.preparation_date == ~D[2010-04-17]
    end

    test "create_field_preparation_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_field_preparation_data(@invalid_attrs)
    end

    test "update_field_preparation_data/2 with valid data updates the field_preparation_data" do
      field_preparation_data = field_preparation_data_fixture()
      assert {:ok, %FieldPreparationData{} = field_preparation_data} = Core.update_field_preparation_data(field_preparation_data, @update_attrs)


      assert field_preparation_data.description == "some updated description"
      assert field_preparation_data.preparation_date == ~D[2011-05-18]
    end

    test "update_field_preparation_data/2 with invalid data returns error changeset" do
      field_preparation_data = field_preparation_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_field_preparation_data(field_preparation_data, @invalid_attrs)
      assert field_preparation_data == Core.get_field_preparation_data!(field_preparation_data.id)
    end

    test "delete_field_preparation_data/1 deletes the field_preparation_data" do
      field_preparation_data = field_preparation_data_fixture()
      assert {:ok, %FieldPreparationData{}} = Core.delete_field_preparation_data(field_preparation_data)
      assert_raise Ecto.NoResultsError, fn -> Core.get_field_preparation_data!(field_preparation_data.id) end
    end

    test "change_field_preparation_data/1 returns a field_preparation_data changeset" do
      field_preparation_data = field_preparation_data_fixture()
      assert %Ecto.Changeset{} = Core.change_field_preparation_data(field_preparation_data)
    end
  end

  describe "sowing_data" do
    alias FarmQ.Core.SowingData

    @valid_attrs %{description: "some description", expected_yield_unit: "some expected_yield_unit", expected_yield_value: "120.5", seed_weight: "120.5", sown_date: ~D[2010-04-17]}
    @update_attrs %{description: "some updated description", expected_yield_unit: "some updated expected_yield_unit", expected_yield_value: "456.7", seed_weight: "456.7", sown_date: ~D[2011-05-18]}
    @invalid_attrs %{description: nil, expected_yield_unit: nil, expected_yield_value: nil, seed_weight: nil, sown_date: nil}

    def sowing_data_fixture(attrs \\ %{}) do
      {:ok, sowing_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_sowing_data()

      sowing_data
    end

    test "list_sowing_data/0 returns all sowing_data" do
      sowing_data = sowing_data_fixture()
      assert Core.list_sowing_data() == [sowing_data]
    end

    test "get_sowing_data!/1 returns the sowing_data with given id" do
      sowing_data = sowing_data_fixture()
      assert Core.get_sowing_data!(sowing_data.id) == sowing_data
    end

    test "create_sowing_data/1 with valid data creates a sowing_data" do
      assert {:ok, %SowingData{} = sowing_data} = Core.create_sowing_data(@valid_attrs)
      assert sowing_data.description == "some description"
      assert sowing_data.expected_yield_unit == "some expected_yield_unit"
      assert sowing_data.expected_yield_value == Decimal.new("120.5")
      assert sowing_data.seed_weight == Decimal.new("120.5")
      assert sowing_data.sown_date == ~D[2010-04-17]
    end

    test "create_sowing_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_sowing_data(@invalid_attrs)
    end

    test "update_sowing_data/2 with valid data updates the sowing_data" do
      sowing_data = sowing_data_fixture()
      assert {:ok, %SowingData{} = sowing_data} = Core.update_sowing_data(sowing_data, @update_attrs)


      assert sowing_data.description == "some updated description"
      assert sowing_data.expected_yield_unit == "some updated expected_yield_unit"
      assert sowing_data.expected_yield_value == Decimal.new("456.7")
      assert sowing_data.seed_weight == Decimal.new("456.7")
      assert sowing_data.sown_date == ~D[2011-05-18]
    end

    test "update_sowing_data/2 with invalid data returns error changeset" do
      sowing_data = sowing_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_sowing_data(sowing_data, @invalid_attrs)
      assert sowing_data == Core.get_sowing_data!(sowing_data.id)
    end

    test "delete_sowing_data/1 deletes the sowing_data" do
      sowing_data = sowing_data_fixture()
      assert {:ok, %SowingData{}} = Core.delete_sowing_data(sowing_data)
      assert_raise Ecto.NoResultsError, fn -> Core.get_sowing_data!(sowing_data.id) end
    end

    test "change_sowing_data/1 returns a sowing_data changeset" do
      sowing_data = sowing_data_fixture()
      assert %Ecto.Changeset{} = Core.change_sowing_data(sowing_data)
    end
  end

  describe "harvest_data" do
    alias FarmQ.Core.HarvestData

    @valid_attrs %{actual_yield_unityield_quality: "some actual_yield_unityield_quality", actual_yield_value: "120.5", description: "some description", harvest_date: ~D[2010-04-17]}
    @update_attrs %{actual_yield_unityield_quality: "some updated actual_yield_unityield_quality", actual_yield_value: "456.7", description: "some updated description", harvest_date: ~D[2011-05-18]}
    @invalid_attrs %{actual_yield_unityield_quality: nil, actual_yield_value: nil, description: nil, harvest_date: nil}

    def harvest_data_fixture(attrs \\ %{}) do
      {:ok, harvest_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_harvest_data()

      harvest_data
    end

    test "list_harvest_data/0 returns all harvest_data" do
      harvest_data = harvest_data_fixture()
      assert Core.list_harvest_data() == [harvest_data]
    end

    test "get_harvest_data!/1 returns the harvest_data with given id" do
      harvest_data = harvest_data_fixture()
      assert Core.get_harvest_data!(harvest_data.id) == harvest_data
    end

    test "create_harvest_data/1 with valid data creates a harvest_data" do
      assert {:ok, %HarvestData{} = harvest_data} = Core.create_harvest_data(@valid_attrs)
      assert harvest_data.actual_yield_unityield_quality == "some actual_yield_unityield_quality"
      assert harvest_data.actual_yield_value == Decimal.new("120.5")
      assert harvest_data.description == "some description"
      assert harvest_data.harvest_date == ~D[2010-04-17]
    end

    test "create_harvest_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_harvest_data(@invalid_attrs)
    end

    test "update_harvest_data/2 with valid data updates the harvest_data" do
      harvest_data = harvest_data_fixture()
      assert {:ok, %HarvestData{} = harvest_data} = Core.update_harvest_data(harvest_data, @update_attrs)


      assert harvest_data.actual_yield_unityield_quality == "some updated actual_yield_unityield_quality"
      assert harvest_data.actual_yield_value == Decimal.new("456.7")
      assert harvest_data.description == "some updated description"
      assert harvest_data.harvest_date == ~D[2011-05-18]
    end

    test "update_harvest_data/2 with invalid data returns error changeset" do
      harvest_data = harvest_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_harvest_data(harvest_data, @invalid_attrs)
      assert harvest_data == Core.get_harvest_data!(harvest_data.id)
    end

    test "delete_harvest_data/1 deletes the harvest_data" do
      harvest_data = harvest_data_fixture()
      assert {:ok, %HarvestData{}} = Core.delete_harvest_data(harvest_data)
      assert_raise Ecto.NoResultsError, fn -> Core.get_harvest_data!(harvest_data.id) end
    end

    test "change_harvest_data/1 returns a harvest_data changeset" do
      harvest_data = harvest_data_fixture()
      assert %Ecto.Changeset{} = Core.change_harvest_data(harvest_data)
    end
  end

  describe "field_clearation_data" do
    alias FarmQ.Core.FieldClearationData

    @valid_attrs %{clearation_date: ~D[2010-04-17], description: "some description"}
    @update_attrs %{clearation_date: ~D[2011-05-18], description: "some updated description"}
    @invalid_attrs %{clearation_date: nil, description: nil}

    def field_clearation_data_fixture(attrs \\ %{}) do
      {:ok, field_clearation_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_field_clearation_data()

      field_clearation_data
    end

    test "list_field_clearation_data/0 returns all field_clearation_data" do
      field_clearation_data = field_clearation_data_fixture()
      assert Core.list_field_clearation_data() == [field_clearation_data]
    end

    test "get_field_clearation_data!/1 returns the field_clearation_data with given id" do
      field_clearation_data = field_clearation_data_fixture()
      assert Core.get_field_clearation_data!(field_clearation_data.id) == field_clearation_data
    end

    test "create_field_clearation_data/1 with valid data creates a field_clearation_data" do
      assert {:ok, %FieldClearationData{} = field_clearation_data} = Core.create_field_clearation_data(@valid_attrs)
      assert field_clearation_data.clearation_date == ~D[2010-04-17]
      assert field_clearation_data.description == "some description"
    end

    test "create_field_clearation_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_field_clearation_data(@invalid_attrs)
    end

    test "update_field_clearation_data/2 with valid data updates the field_clearation_data" do
      field_clearation_data = field_clearation_data_fixture()
      assert {:ok, %FieldClearationData{} = field_clearation_data} = Core.update_field_clearation_data(field_clearation_data, @update_attrs)


      assert field_clearation_data.clearation_date == ~D[2011-05-18]
      assert field_clearation_data.description == "some updated description"
    end

    test "update_field_clearation_data/2 with invalid data returns error changeset" do
      field_clearation_data = field_clearation_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_field_clearation_data(field_clearation_data, @invalid_attrs)
      assert field_clearation_data == Core.get_field_clearation_data!(field_clearation_data.id)
    end

    test "delete_field_clearation_data/1 deletes the field_clearation_data" do
      field_clearation_data = field_clearation_data_fixture()
      assert {:ok, %FieldClearationData{}} = Core.delete_field_clearation_data(field_clearation_data)
      assert_raise Ecto.NoResultsError, fn -> Core.get_field_clearation_data!(field_clearation_data.id) end
    end

    test "change_field_clearation_data/1 returns a field_clearation_data changeset" do
      field_clearation_data = field_clearation_data_fixture()
      assert %Ecto.Changeset{} = Core.change_field_clearation_data(field_clearation_data)
    end
  end

  describe "user" do
    alias FarmQ.Core.User

    test "build_user/0 returns a user changeset" do
      assert %Ecto.Changeset{data: %User{}} = Core.build_user
    end

    test "build_user/1 returns a user changeset with values applied" do
      attrs = %{"name" => "Nittin"}
      changeset = Core.build_user(attrs)
      assert changeset.params == attrs
    end

    test "create_user/1 returns a user for valid data" do
      valid_attrs = %{
      "name" => "Nittin",
      "email" => "nittin@example.com",
      "password" => "password"
      }
      assert {:ok, user} = Core.create_user(valid_attrs)
      assert Comeonin.Bcrypt.checkpw(valid_attrs["password"], user.password_hash)
    end

    test "create_user/1 returns a changeset for invalid data" do
      invalid_attrs = %{}
      assert {:error, %Ecto.Changeset{}} = Core.create_user(invalid_attrs)
    end

    test "get_user_by_email/1" do
      valid_attrs = %{
      "name" => "Nittin",
      "email" => "nittin@example.com",
      "password" => "password"
      }
      user1 = Core.create_user(valid_attrs)
      user_from_db = Core.get_user_by_email("nittin@example.com")
      assert user1.id == user_from_db.id
    end

    test "get_user_by_credentials/1" do
      valid_attrs = %{
      "name" => "Nittin",
      "email" => "nittin@example.com",
      "password" => "password"
      }
      user1 = Core.create_user(valid_attrs)
      user_from_db = Core.get_user_by_credentials(valid_attrs)
      assert user1.id == user_from_db.id
    end

  describe "sensor_data" do
    alias FarmQ.Core.SensorData

    @valid_attrs %{collected_time: "2010-04-17T14:00:00Z", value: "120.5"}
    @update_attrs %{collected_time: "2011-05-18T15:01:01Z", value: "456.7"}
    @invalid_attrs %{collected_time: nil, value: nil}

    def sensor_data_fixture(attrs \\ %{}) do
      {:ok, sensor_data} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Core.create_sensor_data()

      sensor_data
    end

    test "list_sensor_data/0 returns all sensor_data" do
      sensor_data = sensor_data_fixture()
      assert Core.list_sensor_data() == [sensor_data]
    end

    test "get_sensor_data!/1 returns the sensor_data with given id" do
      sensor_data = sensor_data_fixture()
      assert Core.get_sensor_data!(sensor_data.id) == sensor_data
    end

    test "create_sensor_data/1 with valid data creates a sensor_data" do
      assert {:ok, %SensorData{} = sensor_data} = Core.create_sensor_data(@valid_attrs)
      assert sensor_data.collected_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert sensor_data.value == Decimal.new("120.5")
    end

    test "create_sensor_data/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Core.create_sensor_data(@invalid_attrs)
    end

    test "update_sensor_data/2 with valid data updates the sensor_data" do
      sensor_data = sensor_data_fixture()
      assert {:ok, %SensorData{} = sensor_data} = Core.update_sensor_data(sensor_data, @update_attrs)

      
      assert sensor_data.collected_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert sensor_data.value == Decimal.new("456.7")
    end

    test "update_sensor_data/2 with invalid data returns error changeset" do
      sensor_data = sensor_data_fixture()
      assert {:error, %Ecto.Changeset{}} = Core.update_sensor_data(sensor_data, @invalid_attrs)
      assert sensor_data == Core.get_sensor_data!(sensor_data.id)
    end

    test "delete_sensor_data/1 deletes the sensor_data" do
      sensor_data = sensor_data_fixture()
      assert {:ok, %SensorData{}} = Core.delete_sensor_data(sensor_data)
      assert_raise Ecto.NoResultsError, fn -> Core.get_sensor_data!(sensor_data.id) end
    end

    test "change_sensor_data/1 returns a sensor_data changeset" do
      sensor_data = sensor_data_fixture()
      assert %Ecto.Changeset{} = Core.change_sensor_data(sensor_data)
    end
  end
end
