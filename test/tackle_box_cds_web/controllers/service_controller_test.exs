defmodule TackleBoxCdsWeb.ServiceControllerTest do
  use TackleBoxCdsWeb.ConnCase

  alias TackleBoxCds.CDSHooks
  alias TackleBoxCds.CDSHooks.Service

  @create_attrs %{
    description: "some description",
    hook: "some-hook",
    prefetch: %{},
    title: "some title"
  }
  @update_attrs %{
    description: "some updated description",
    hook: "some-updated-hook",
    prefetch: %{},
    title: "some updated title"
  }
  @invalid_attrs %{description: nil, hook: nil, prefetch: nil, title: nil}

  def fixture(:service) do
    {:ok, service} = CDSHooks.create_service(@create_attrs)
    service
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all services", %{conn: conn} do
      conn = get(conn, Routes.service_path(conn, :index))
      assert json_response(conn, 200)["services"] == []
    end
  end

  describe "create service" do
    test "renders service when data is valid", %{conn: conn} do
      conn = post(conn, Routes.service_path(conn, :create), service: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["service"]

      conn = get(conn, Routes.service_path(conn, :show, id))

      assert %{
               "id" => _id
             } = json_response(conn, 200)["service"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.service_path(conn, :create), service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update service" do
    setup [:create_service]

    test "renders service when data is valid", %{conn: conn, service: %Service{id: id} = service} do
      conn = put(conn, Routes.service_path(conn, :update, service), service: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["service"]

      conn = get(conn, Routes.service_path(conn, :show, id))

      assert %{
               "id" => _id
             } = json_response(conn, 200)["service"]
    end

    test "renders errors when data is invalid", %{conn: conn, service: service} do
      conn = put(conn, Routes.service_path(conn, :update, service), service: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete service" do
    setup [:create_service]

    test "deletes chosen service", %{conn: conn, service: service} do
      conn = delete(conn, Routes.service_path(conn, :delete, service))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.service_path(conn, :show, service))
      end
    end
  end

  defp create_service(_) do
    service = fixture(:service)
    %{service: service}
  end
end
