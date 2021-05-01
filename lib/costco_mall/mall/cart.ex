defmodule CostcoMall.Mall.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  schema "carts" do
    field :count, :integer
    field :total, :integer

    timestamps()
  end

  @doc false
  def changeset(cart, attrs) do
    cart
    |> cast(attrs, [:count, :total])
    |> validate_required([:count, :total])
  end
end
