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
        description: "some description",
        name: "some name",
        price: "120.5",
        quantity: 42
      })
      |> SimpleCrud.Catalog.create_product()

    product
  end
end
