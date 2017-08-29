defmodule CServ.Budget do
  use Ecto.Schema
  import Ecto.Changeset
  alias CServ.Budget


  schema "budgets" do
    field :amount, :float
    has_many :ads, CServ.Ad

    timestamps()
  end

  @doc false
  def changeset(%Budget{} = budget, attrs) do
    budget
    |> cast(attrs, [:amount])
    |> validate_required([:amount])
  end
end
