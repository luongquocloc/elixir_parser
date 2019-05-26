defmodule ParserTest do
  use ExUnit.Case

  test "test test" do
    IO.puts("Test parse first line")
    data = Parser.parser
    first_row = Enum.at(data,1)
    IO.inspect first_row
  end
end
