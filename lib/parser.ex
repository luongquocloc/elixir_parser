defmodule Parser do
  @filepath "data/data.txt"
  def main(_args) do
    parser()
  end

  def parser do
    ####fDAta = File read with ! is fn with error msg
    fData = File.read!(@filepath)

    ##Split head and data rows by split new line
    [_header | rows] = String.split(fData, ~r/\R/)

    a = rows |> Enum.map(fn(row) -> String.split(row, "\t") end) ###split tab and map to rows list a
    |> Enum.filter(&data_row?(&1)) ###Enum filter data by col &1 is param passed
    |> Enum.map(&parser_column(&1))
    |> Enum.map(&format_column(&1))
    |> Enum.into(%{}) ###Enum data to t
#    IO.inspect(a)
  end

  ###Check data_row is valid : boolean func
  defp data_row?(row) do
    case row do
      [post, _, _, _, _, latidue, longitude] -> true
      _ -> false
    end
  end

  ###Function map data to list [post, latidue, longitude] and remove unused col
  def parser_column(row) do
    [post, _, _, _, _, latidue, longitude] = row
    [post, latidue, longitude]
  end

  ###format column: remove space, and convert string to float for la and longitude and then put to map  {post, {latidue, longitude}}
  def format_column(row) do
    [post, latidue, longitude] = row
    latidue = latidue |> String.replace(" ", "") |> String.to_float
    longitude = longitude |> String.replace(" ", "") |> String.to_float
    {post, {latidue, longitude}}
  end

end
