  defmodule Store do
    alias Parser
    use GenServer

    #GenServer.start_link(module, init_arg, options \\ [])
    def start_link do
      GenServer.start_link(__MODULE__, %{}, name: :code_store)
    end

    ###INIT Tuple data from Paser.parser
    def init(_) do
      {:ok, Parser.parser}
    end

    ###get geo data by postal_code get from init data
    def get_geolocation(postal_code) do
      GenServer.call(:code_store, {:get_geolocation, postal_code})
    end

    def handle_call({:get_geolocation, postal_code}, _from, geo_data) do
      geolocaiton = Map.get(geo_data, postal_code)
      {:reply, geolocaiton, geo_data}
    end

  end
