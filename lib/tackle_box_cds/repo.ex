defmodule TackleBoxCds.Repo do
  use Ecto.Repo,
    otp_app: :tackle_box_cds,
    adapter: Ecto.Adapters.Postgres
end
