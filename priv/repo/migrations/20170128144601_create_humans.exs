defmodule HumanRegistry.Repo.Migrations.CreateHumans do
  use Ecto.Migration

  def change do
    create table(:humans) do
      add :names, {:array, :string}
      add :emails, {:array, :string}
      timestamps()
    end

  end
end
