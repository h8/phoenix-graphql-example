defmodule CServ.Repo.Migrations.CreateCampaigns do
  use Ecto.Migration

  def change do
    create table(:campaigns) do
      add :title, :string
      add :running, :boolean, default: false, null: false

      timestamps()
    end

  end
end
