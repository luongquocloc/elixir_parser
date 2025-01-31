
defmodule Lab1.Supervisor do
  use Supervisor
  alias Lab1.Store

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Lab1.Store, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end
