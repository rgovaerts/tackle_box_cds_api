defmodule TackleBoxCds.CDSHooks.ServiceInvoker  do
  @callback invoke(url :: String.t, body :: term, headers :: term) :: {:ok, term} | {:error, String.t}
end
