defmodule CServ.Targeting do
  use Ecto.Schema
  import Ecto.Changeset
  alias CServ.Targeting


  schema "targetings" do
    field :data, :string
    field :title, :string
    belongs_to :ad, CServ.Ad

    timestamps()
  end

  @doc false
  def changeset(%Targeting{} = targeting, attrs) do
    targeting
    |> cast(attrs, [:title, :data])
    |> validate_required([:title, :data])
  end
end
