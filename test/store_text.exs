defmodule StoreTest do
  use ExUnit.Case

  test "test geo" do
    Lab1.Store.start_link
    {latitude, longtitude} = Lab1.Store.get_geolocation("66010")
    assert is_float(latitude)
    assert is_float(longtitude)
  end
end
