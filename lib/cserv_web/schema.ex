defmodule CServ.Schema do
  use Absinthe.Schema
  import_types CServ.Schema.Types

  alias CServ.CampaignResolver

  query do
    @desc "Get campaigns list."
    field :campaigns, list_of(:campaign) do
      arg :running, :boolean, description: "Specifies running status."
      resolve &CampaignResolver.all/2
    end

    @desc "Get campaign by ID."
    field :campaign, :campaign do
      arg :id, non_null(:id), description: "Specifies campaign ID."
      resolve &CampaignResolver.find/2
    end
  end

  input_object :input_targeting do
    field :title, non_null(:string)
    field :data, non_null(:string)
  end

  input_object :input_ad do
    field :title, non_null(:string)
    field :targetings, list_of(:input_targeting)
  end

  mutation do
    @desc "Create new campaign."
    field :create_campaign, type: :campaign do
      arg :title, non_null(:string)
      arg :running, :boolean
      arg :ads, list_of(:input_ad)

      resolve &CampaignResolver.create/2
    end

    field :update_campaign_status, :campaign do
      arg :id, non_null(:integer)
      arg :running, non_null(:boolean)

      resolve &CampaignResolver.update_status/2
    end

    field :delete_campaign, :campaign do
      arg :id, non_null(:integer)

      resolve &CampaignResolver.delete/2
    end
  end
end