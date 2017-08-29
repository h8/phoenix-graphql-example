defmodule CServ.CampaignResolver do
  alias CServ.Repo
  alias CServ.Campaign

  import Ecto.Query

  def all(%{running: running}, _info) do
    {:ok, Repo.all(from c in Campaign, where: c.running == ^running)}
  end

  def all(_args, _info) do
    {:ok, Repo.all(Campaign)}
  end

  def find(%{id: id}, _info) do
    case Repo.get(Campaign, id) do
      nil -> {:error, "Campaign id #{id} not found"}
      campaign -> {:ok, campaign}
    end
  end

  def create(args, _info) do
    %Campaign{}
    |> Campaign.changeset(args)
    |> Repo.insert
  end

  def update_status(%{id: id, running: running}, _info) do
    Repo.get!(Campaign, id)
    |> Campaign.changeset(%{running: running})
    |> Repo.update
  end

  def delete(%{id: id}, _info) do
    campaign = Repo.get!(Campaign, id)
    Repo.delete(campaign)
  end
end