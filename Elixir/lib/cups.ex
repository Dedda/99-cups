defmodule Cups do

  @on_the_wall " on the wall."

  def cups do
    0..99
    |> Enum.reverse
    |> Enum.flat_map(&verse/1)
  end

  defp verse(number) do
    [
      cups_on_wall_line(number),
      take_down_line(number),
    ]
  end

  defp cups_on_wall_line(number) do
    "#{cups_on_wall(number)} #{cups_text(number)}"
  end

  defp take_down_line(0) do
    "Go to the store and buy some more. #{cups_on_wall(99)}"
  end

  defp take_down_line(number) do
    it = case number do
      1 -> "it"
      _ -> "one"
    end
    "Take #{it} down and pass it around. #{cups_on_wall(number - 1)}"
  end

  defp cups_on_wall(number) do
    "#{cups_text(number)}#{@on_the_wall}"
  end

  defp cups_text(0) do
    "No more cups of tea"
  end

  defp cups_text(1) do
    "One more cup of tea"
  end

  defp cups_text(number) do
    "#{number} cups of tea"
  end
end
