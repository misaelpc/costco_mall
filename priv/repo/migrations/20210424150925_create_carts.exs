defmodule CostcoMall.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def change do
    create table(:carts) do
      add :count, :integer
      add :total, :integer

      timestamps()
    end

  end
end
