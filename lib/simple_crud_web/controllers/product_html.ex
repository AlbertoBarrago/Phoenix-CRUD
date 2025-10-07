defmodule SimpleCrudWeb.ProductHTML do
  use SimpleCrudWeb, :html

  embed_templates "product_html/*"

  @doc """
  Renders a product form.

  The form is defined in the template at
  product_html/product_form.html.heex
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true
  attr :return_to, :string, default: nil

  def product_form(assigns)
end
