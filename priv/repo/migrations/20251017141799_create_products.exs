defmodule SimpleCrud.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string, null: false
      add :description, :string
      add :price, :decimal, precision: 10, scale: 2, null: false
      add :category, :string, null: false
      add :in_stock, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
