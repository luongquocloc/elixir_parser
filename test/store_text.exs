defmodule StoreTest do
  use ExUnit.Case

  test "test geo" do
    Store.start_link
    {latitude, longtitude} = Store.get_geolocation("66010")
    assert is_float(latitude)
    assert is_float(longtitude)
  end
end
