defmodule DeliveryParser do
  use Application

  def start(_type, _args) do
    Lab1.Supervisor.start_link

  end

end
