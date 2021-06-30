defmodule TackleBoxCds.CDSHooks.ServiceInvokerMock do
  @behaviour TackleBoxCds.CDSHooks.ServiceInvoker

  def invoke(_url, _body, _headers) do
    {:ok, %HTTPoison.Response{status_code: 200, body: ""}}
  end


end
