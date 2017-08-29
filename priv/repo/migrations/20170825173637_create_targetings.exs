defmodule CServ.Repo.Migrations.CreateTargetings do
  use Ecto.Migration

  def change do
    create table(:targetings) do
      add :title, :string
      add :data, :string
      add :ad_id, references(:ads, on_delete: :nothing)

      timestamps()
    end

    create index(:targetings, [:ad_id])
  end
end
