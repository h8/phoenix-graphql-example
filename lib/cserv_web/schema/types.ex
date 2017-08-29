defmodule CServ.Schema.Types do
  use Absinthe.Schema.Notation
  use Absinthe.Ecto, repo: CServ.Repo

  object :campaign do
    field :id, :id
    field :title, :string
    field :running, :boolean
    field :ads, list_of(:ad), resolve: assoc(:ads)
    #TODO: add calculated field here
  end

  object :budget do
    field :id, :id
    field :amount, :float
    field :ads, list_of(:ad), resolve: assoc(:ads)
  end

  object :targeting do
    field :id, :id
    field :title, :string
    field :data, :string
  end

  object :ad do
    field :id, :id
    field :title, :string
    field :targetings, list_of(:targeting), resolve: assoc(:targetings)
    field :budget, :budget, resolve: assoc(:budget)
    field :campaign, :campaign, resolve: assoc(:campaign)
  end
end