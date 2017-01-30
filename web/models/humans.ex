defmodule HumanRegistry.Humans do
  use HumanRegistry.Web, :model

  schema "humans" do
    field :names, {:array, :string}
    field :emails, {:array, :string}
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:names, :emails])
    |> validate_required([])
  end
end
