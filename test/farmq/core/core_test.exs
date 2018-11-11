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
end
