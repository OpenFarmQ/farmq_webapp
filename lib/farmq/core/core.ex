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
end
