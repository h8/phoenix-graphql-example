defmodule CServ.Repo.Migrations.CreateBudgets do
  use Ecto.Migration

  def change do
    create table(:budgets) do
      add :amount, :float

      timestamps()
    end

  end
end
