defmodule CostcoMall do
  @moduledoc """
  CostcoMall keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  def send_message do
    {:ok, body} = Fcmex.push("f2e5LGzRSRG2IaHVt7KCZy:APA91bH3lXm-wJDnvJyDt2ssCGGrR35D9XS1lHpKHsuDPJWxiCnPMz0aPaeYQM6Uo57P5hz5xi4dBysMp6ccNc-7IWxI2cPnuwuwSDiYkCPqWrC3Vm7Eo0CqHI4klItnL8EIi7xv3XWK",
      notification: %{
        title: "foo",
        body: "bar",
        click_action: "open_foo",
        icon: "new",
      }
    )
  end
end
