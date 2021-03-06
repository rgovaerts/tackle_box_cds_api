defmodule TackleBoxCds.CDSHooks.Service do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "services" do
    field :hook, :string
    field :title, :string
    field :description, :string
    field :prefetch, :map
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(service, attrs) do
    service
    |> cast(attrs, [:hook, :title, :description, :prefetch, :url])
    |> validate_required([:hook, :description, :url])
  end
end
