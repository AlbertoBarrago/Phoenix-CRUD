defmodule SimpleCrud.Repo.Migrations.AddQuantityToProducts do
  use Ecto.Migration

  def change do
    alter table(:products) do
      add :quantity, :integer, default: 0, null: false
    end
  end
end