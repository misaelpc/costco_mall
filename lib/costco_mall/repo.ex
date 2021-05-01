defmodule CostcoMall.Repo do
  use Ecto.Repo,
    otp_app: :costco_mall,
    adapter: Ecto.Adapters.Postgres
end
