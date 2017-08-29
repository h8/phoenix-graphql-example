# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CServ.Repo.insert!(%CServ.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias CServ.Repo
alias CServ.Campaign
alias CServ.Budget
alias CServ.Ad
alias CServ.Targeting

Repo.insert! %Campaign{
  title: "Campaign One",
  running: true
}

Repo.insert! %Budget{
  amount: 100.50
}

Repo.insert! %Ad{
  title: "Line item 1",
  campaign_id: 1,
  budget_id: 1
}

Repo.insert! %Targeting{
  ad_id: 1,
  title: "Segment targeting",
  data: "[\"Gamers\", \"Engineers\"]"
}

Repo.insert! %Targeting{
  ad_id: 1,
  title: "Countries",
  data: "[\"US\", \"AU\"]"
}
