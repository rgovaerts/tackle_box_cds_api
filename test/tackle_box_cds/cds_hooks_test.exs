defmodule TackleBoxCds.CDSHooksTest do
  use TackleBoxCds.DataCase

  alias TackleBoxCds.CDSHooks

  describe "services" do
    alias TackleBoxCds.CDSHooks.Service

    @valid_attrs %{hook: "patient-view", description: "description of this service"}
    @update_attrs %{hook: "updated-patient-view", description: "updated description of this service"}
    @invalid_attrs %{hook: nil, description: nil, title: 123}

    def service_fixture(attrs \\ %{}) do
      {:ok, service} =
        attrs
        |> Enum.into(@valid_attrs)
        |> CDSHooks.create_service()

      service
    end

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert CDSHooks.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert CDSHooks.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      assert {:ok, %Service{} = _service} = CDSHooks.create_service(@valid_attrs)
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CDSHooks.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      assert {:ok, %Service{} = _service} = CDSHooks.update_service(service, @update_attrs)
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = CDSHooks.update_service(service, @invalid_attrs)
      assert service == CDSHooks.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = CDSHooks.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> CDSHooks.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = CDSHooks.change_service(service)
    end
  end
end
