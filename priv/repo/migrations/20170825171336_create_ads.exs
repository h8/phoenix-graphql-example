defmodule CServ.Repo.Migrations.CreateAds do
  use Ecto.Migration

  def change do
    create table(:ads) do
      add :title, :string
      add :budget_id, references(:budgets, on_delete: :nothing)
      add :campaign_id, references(:campaigns, on_delete: :nothing)

      timestamps()
    end

    create index(:ads, [:budget_id])
    create index(:ads, [:campaign_id])
  end
end
