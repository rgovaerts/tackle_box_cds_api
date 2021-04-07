defmodule TackleBoxCdsWeb.ServiceView do
  use TackleBoxCdsWeb, :view
  alias TackleBoxCdsWeb.ServiceView

  def render("index.json", %{services: services}) do
    %{services: render_many(services, ServiceView, "service.json")}
  end

  def render("show.json", %{service: service}) do
    %{service: render_one(service, ServiceView, "service.json")}
  end

  def render("service.json", %{service: service}) do
    %{
      id: service.id,
      hook: service.hook,
      title: service.title,
      description: service.description,
      prefetch: service.prefetch
    }
  end
end
