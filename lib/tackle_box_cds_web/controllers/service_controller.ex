defmodule TackleBoxCdsWeb.ServiceController do
  use TackleBoxCdsWeb, :controller

  alias TackleBoxCds.CDSHooks
  alias TackleBoxCds.CDSHooks.Service

  action_fallback TackleBoxCdsWeb.FallbackController

  def index(conn, _params) do
    services = CDSHooks.list_services()
    render(conn, "index.json", services: services)
  end

  def create(conn, %{"service" => service_params}) do
    with {:ok, %Service{} = service} <- CDSHooks.create_service(service_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.service_path(conn, :show, service))
      |> render("show.json", service: service)
    end
  end

  def show(conn, %{"id" => id}) do
    service = CDSHooks.get_service!(id)
    render(conn, "show.json", service: service)
  end

  def update(conn, %{"id" => id, "service" => service_params}) do
    service = CDSHooks.get_service!(id)

    with {:ok, %Service{} = service} <- CDSHooks.update_service(service, service_params) do
      render(conn, "show.json", service: service)
    end
  end

  def delete(conn, %{"id" => id}) do
    service = CDSHooks.get_service!(id)

    with {:ok, %Service{}} <- CDSHooks.delete_service(service) do
      send_resp(conn, :no_content, "")
    end
  end
end
