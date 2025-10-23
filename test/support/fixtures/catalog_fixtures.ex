defmodule SimpleCrud.CatalogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `SimpleCrud.Catalog` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        description: "some description",
        price: "120.50",
        quantity: 42,
        category: "TEST",
        in_stock: true
      })
      |> SimpleCrud.Catalog.create_product()

    product
  end
end
