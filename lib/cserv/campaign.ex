defmodule CServ.Campaign do
  use Ecto.Schema
  import Ecto.Changeset
  alias CServ.Campaign


  schema "campaigns" do
    field :running, :boolean, default: false
    field :title, :string
    has_many :ads, CServ.Ad

    timestamps()
  end

  @doc false
  def changeset(%Campaign{} = campaign, attrs) do
    campaign
    |> cast(attrs, [:title, :running])
    |> validate_required([:title, :running])
    |> cast_assoc(:ads, required: false)
  end
end
