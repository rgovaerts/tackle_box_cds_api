defmodule TackleBoxCds.CDSHooks.ServiceInvokerHttp do
  @behaviour TackleBoxCds.CDSHooks.ServiceInvoker

  def invoke(url, body, _headers) do
    HTTPoison.post(url, body)
  end


end
