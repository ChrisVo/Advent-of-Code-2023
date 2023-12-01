defmodule AdventOfCode2023DayOne do
  def readFile(filePath) do
    {:ok, txt} = File.read(filePath)
    txt
    |> to_string()
  end

  def splitIntoLines(txt) do
    String.split(txt, "\n")
  end

  def find_first_digit(str) do
    case Regex.run(~r/(?<=\D|^)\d/, str) do
      [match] -> String.to_integer(match)
      nil -> nil  # No match found
    end


  end

  def find_last_digit(str) do
    matches = Regex.scan(~r/\d/, str)
    case List.last(matches) do
      [match] -> String.to_integer(match)
      nil -> nil  # No match found
    end
  end

  def combine_digits(first, last) do
    case {first, last} do
      {nil, nil} -> nil
      {nil, _} -> last
      {_, nil} -> first
      {_, _} -> first * 10 + last
    end
  end

  def iterate_through_lines(lines) do
    lines
    |> Enum.map(fn line ->
      first = find_first_digit(line)
      last = find_last_digit(line)
      combine_digits(first, last)
    end)
  end

  def getSum(numbers) do
    numbers
    |> Enum.filter(&(!is_nil(&1)))  # Filter out nil values
    |> Enum.reduce(0, fn number, sum -> sum + number end)
  end
end
