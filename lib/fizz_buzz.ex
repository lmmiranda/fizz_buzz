defmodule FizzBuzz do
  def build(file_name) do
    file_name
    |> File.read()
    |> handle_file_result()
  end

  defp handle_file_result({:ok, result}) do
    result =
    result
    |> String.split(",")
    |> Enum.map(&convert_and_evaluate_numbers/1)

    {:ok, result}
  end

  defp handle_file_result({:error, error}), do: {:error, "Error reading file: #{error}"}

  defp convert_and_evaluate_numbers(elem) do
    number = String.to_integer(elem)
    evaluate_number(number)
  end

  defp evaluate_number(number) when rem(number, 3) == 0 and rem(number, 5) == 0, do: :fizzBuzz
  defp evaluate_number(number) when rem(number, 3) == 0, do: :fizz
  defp evaluate_number(number) when rem(number, 5) == 0, do: :buzz
  defp evaluate_number(number), do: number
end
