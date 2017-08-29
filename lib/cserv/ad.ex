defmodule CServ.Ad do
  use Ecto.Schema
  import Ecto.Changeset
  alias CServ.Ad


  schema "ads" do
    field :title, :string
    belongs_to :budget, CServ.Budget
    belongs_to :campaign, CServ.Campaign
    has_many :targetings, CServ.Targeting

    timestamps()
  end

  @doc false
  def changeset(%Ad{} = ad, attrs) do
    ad
    |> cast(attrs, [:title])
    |> validate_required([:title])
    |> cast_assoc(:targetings, required: false)
  end
end
