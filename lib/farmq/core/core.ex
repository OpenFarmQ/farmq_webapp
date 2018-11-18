defmodule FarmQ.Core do
  @moduledoc """
  The Core context.
  """

  import Ecto.Query, warn: false
  alias FarmQ.Repo

  alias FarmQ.Core.Parameter

  @doc """
  Returns the list of parameters.

  ## Examples

      iex> list_parameters()
      [%Parameter{}, ...]

  """
  def list_parameters do
    Repo.all(Parameter)
  end

  @doc """
  Gets a single parameter.

  Raises `Ecto.NoResultsError` if the Parameter does not exist.

  ## Examples

      iex> get_parameter!(123)
      %Parameter{}

      iex> get_parameter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_parameter!(id), do: Repo.get!(Parameter, id)

  @doc """
  Creates a parameter.

  ## Examples

      iex> create_parameter(%{field: value})
      {:ok, %Parameter{}}

      iex> create_parameter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_parameter(attrs \\ %{}) do
    %Parameter{}
    |> Parameter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a parameter.

  ## Examples

      iex> update_parameter(parameter, %{field: new_value})
      {:ok, %Parameter{}}

      iex> update_parameter(parameter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_parameter(%Parameter{} = parameter, attrs) do
    parameter
    |> Parameter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Parameter.

  ## Examples

      iex> delete_parameter(parameter)
      {:ok, %Parameter{}}

      iex> delete_parameter(parameter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_parameter(%Parameter{} = parameter) do
    Repo.delete(parameter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking parameter changes.

  ## Examples

      iex> change_parameter(parameter)
      %Ecto.Changeset{source: %Parameter{}}

  """
  def change_parameter(%Parameter{} = parameter) do
    Parameter.changeset(parameter, %{})
  end

  alias FarmQ.Core.Plant

  @doc """
  Returns the list of plants.

  ## Examples

      iex> list_plants()
      [%Plant{}, ...]

  """
  def list_plants do
    Repo.all(Plant)
  end

  @doc """
  Gets a single plant.

  Raises `Ecto.NoResultsError` if the Plant does not exist.

  ## Examples

      iex> get_plant!(123)
      %Plant{}

      iex> get_plant!(456)
      ** (Ecto.NoResultsError)

  """
  def get_plant!(id), do: Repo.get!(Plant, id)

  @doc """
  Creates a plant.

  ## Examples

      iex> create_plant(%{field: value})
      {:ok, %Plant{}}

      iex> create_plant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_plant(attrs \\ %{}) do
    %Plant{}
    |> Plant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a plant.

  ## Examples

      iex> update_plant(plant, %{field: new_value})
      {:ok, %Plant{}}

      iex> update_plant(plant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_plant(%Plant{} = plant, attrs) do
    plant
    |> Plant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Plant.

  ## Examples

      iex> delete_plant(plant)
      {:ok, %Plant{}}

      iex> delete_plant(plant)
      {:error, %Ecto.Changeset{}}

  """
  def delete_plant(%Plant{} = plant) do
    Repo.delete(plant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking plant changes.

  ## Examples

      iex> change_plant(plant)
      %Ecto.Changeset{source: %Plant{}}

  """
  def change_plant(%Plant{} = plant) do
    Plant.changeset(plant, %{})
  end

  alias FarmQ.Core.FieldBot

  @doc """
  Returns the list of field_bots.

  ## Examples

      iex> list_field_bots()
      [%FieldBot{}, ...]

  """
  def list_field_bots() do
    FieldBot
    |> Repo.all
  end



  @doc """
  Gets a single field_bot.

  Raises `Ecto.NoResultsError` if the Field bot does not exist.

  ## Examples

      iex> get_field_bot!(123)
      %FieldBot{}

      iex> get_field_bot!(456)
      ** (Ecto.NoResultsError)

  """
  def get_field_bot!(id), do: Repo.get!(FieldBot, id)

  @doc """
  Creates a field_bot.

  ## Examples

      iex> create_field_bot(%{field: value})
      {:ok, %FieldBot{}}

      iex> create_field_bot(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_field_bot(attrs \\ %{}) do
    %FieldBot{}
    |> FieldBot.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a field_bot.

  ## Examples

      iex> update_field_bot(field_bot, %{field: new_value})
      {:ok, %FieldBot{}}

      iex> update_field_bot(field_bot, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_field_bot(%FieldBot{} = field_bot, attrs) do
    field_bot
    |> FieldBot.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a FieldBot.

  ## Examples

      iex> delete_field_bot(field_bot)
      {:ok, %FieldBot{}}

      iex> delete_field_bot(field_bot)
      {:error, %Ecto.Changeset{}}

  """
  def delete_field_bot(%FieldBot{} = field_bot) do
    Repo.delete(field_bot)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking field_bot changes.

  ## Examples

      iex> change_field_bot(field_bot)
      %Ecto.Changeset{source: %FieldBot{}}

  """
  def change_field_bot(%FieldBot{} = field_bot) do
    FieldBot.changeset(field_bot, %{})
  end

  alias FarmQ.Core.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  def list_locations(type) do
    Location
    |> where([l], l.type == ^type)
    |> Repo.all
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{source: %Location{}}

  """
  def change_location(%Location{} = location) do
    Location.changeset(location, %{})
  end

  alias FarmQ.Core.Sensor

  @doc """
  Returns the list of sensors.

  ## Examples

      iex> list_sensors()
      [%Sensor{}, ...]

  """
  def list_sensors do
    Repo.all(Sensor)
  end

  @doc """
  Gets a single sensor.

  Raises `Ecto.NoResultsError` if the Sensor does not exist.

  ## Examples

      iex> get_sensor!(123)
      %Sensor{}

      iex> get_sensor!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sensor!(id), do: Repo.get!(Sensor, id)

  @doc """
  Creates a sensor.

  ## Examples

      iex> create_sensor(%{field: value})
      {:ok, %Sensor{}}

      iex> create_sensor(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sensor(attrs \\ %{}) do
    %Sensor{}
    |> Sensor.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sensor.

  ## Examples

      iex> update_sensor(sensor, %{field: new_value})
      {:ok, %Sensor{}}

      iex> update_sensor(sensor, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sensor(%Sensor{} = sensor, attrs) do
    sensor
    |> Sensor.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sensor.

  ## Examples

      iex> delete_sensor(sensor)
      {:ok, %Sensor{}}

      iex> delete_sensor(sensor)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sensor(%Sensor{} = sensor) do
    Repo.delete(sensor)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sensor changes.

  ## Examples

      iex> change_sensor(sensor)
      %Ecto.Changeset{source: %Sensor{}}

  """
  def change_sensor(%Sensor{} = sensor) do
    Sensor.changeset(sensor, %{})
  end

  alias FarmQ.Core.CropCycle

  @doc """
  Returns the list of crop_cycles.

  ## Examples

      iex> list_crop_cycles()
      [%CropCycle{}, ...]

  """
  def list_crop_cycles do
    Repo.all(CropCycle)
  end

  @doc """
  Gets a single crop_cycle.

  Raises `Ecto.NoResultsError` if the Crop cycle does not exist.

  ## Examples

      iex> get_crop_cycle!(123)
      %CropCycle{}

      iex> get_crop_cycle!(456)
      ** (Ecto.NoResultsError)

  """
  def get_crop_cycle!(id), do: Repo.get!(CropCycle, id)

  @doc """
  Creates a crop_cycle.

  ## Examples

      iex> create_crop_cycle(%{field: value})
      {:ok, %CropCycle{}}

      iex> create_crop_cycle(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_crop_cycle(attrs \\ %{}) do
    %CropCycle{}
    |> CropCycle.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a crop_cycle.

  ## Examples

      iex> update_crop_cycle(crop_cycle, %{field: new_value})
      {:ok, %CropCycle{}}

      iex> update_crop_cycle(crop_cycle, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_crop_cycle(%CropCycle{} = crop_cycle, attrs) do
    crop_cycle
    |> CropCycle.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a CropCycle.

  ## Examples

      iex> delete_crop_cycle(crop_cycle)
      {:ok, %CropCycle{}}

      iex> delete_crop_cycle(crop_cycle)
      {:error, %Ecto.Changeset{}}

  """
  def delete_crop_cycle(%CropCycle{} = crop_cycle) do
    Repo.delete(crop_cycle)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking crop_cycle changes.

  ## Examples

      iex> change_crop_cycle(crop_cycle)
      %Ecto.Changeset{source: %CropCycle{}}

  """
  def change_crop_cycle(%CropCycle{} = crop_cycle) do
    CropCycle.changeset(crop_cycle, %{})
  end
end
