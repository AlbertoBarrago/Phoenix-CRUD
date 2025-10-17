defmodule SimpleCrud.Catalog.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :quantity, :integer
    field :category, :string
    field :in_stock, :boolean, default: false
    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :description, :price, :quantity, :category, :in_stock])
    |> validate_required([:name, :description, :price, :quantity, :category, :in_stock])
    |> validate_number(:quantity, greater_than_or_equal_to: 0)
  end
end