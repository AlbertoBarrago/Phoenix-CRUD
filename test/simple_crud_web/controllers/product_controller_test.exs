defmodule SimpleCrudWeb.ProductControllerTest do
  use SimpleCrudWeb.ConnCase

  import SimpleCrud.CatalogFixtures

  @create_attrs %{
    name: "some name",
    description: "some description",
    price: "120.5",
    quantity: 42,
    category: "TEST",
    in_stock: true
  }
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    price: "456.7",
    quantity: 43,
    category: "TEST_UPDATE",
    in_stock: false
  }
  @invalid_attrs %{
    name: nil,
    description: nil,
    price: nil,
    quantity: nil,
    category: nil,
    in_stock: nil
  }

  describe "index" do
    test "lists all products", %{conn: conn} do
      conn = get(conn, ~p"/products")
      assert html_response(conn, 200) =~ "Listing Products"
    end
  end

  describe "new product" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/products/new")
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "create product" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/products", product: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/products/#{id}"

      conn = get(conn, ~p"/products/#{id}")
      assert html_response(conn, 200) =~ "Product #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/products", product: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Product"
    end
  end

  describe "edit product" do
    setup [:create_product]

    test "renders form for editing chosen product", %{conn: conn, product: product} do
      conn = get(conn, ~p"/products/#{product}/edit")
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "update product" do
    setup [:create_product]

    test "redirects when data is valid", %{conn: conn, product: product} do
      conn = put(conn, ~p"/products/#{product}", product: @update_attrs)
      assert redirected_to(conn) == ~p"/products/#{product}"

      conn = get(conn, ~p"/products/#{product}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, product: product} do
      conn = put(conn, ~p"/products/#{product}", product: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Product"
    end
  end

  describe "delete product" do
    setup [:create_product]

    test "deletes chosen product", %{conn: conn, product: product} do
      conn = delete(conn, ~p"/products/#{product}")
      assert redirected_to(conn) == ~p"/products"

      assert_error_sent 404, fn ->
        get(conn, ~p"/products/#{product}")
      end
    end
  end

  defp create_product(_) do
    product = product_fixture()

    %{product: product}
  end
end
