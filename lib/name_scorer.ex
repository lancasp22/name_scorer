defmodule NameScorer do
  def score(sourceName, targetName) when sourceName == targetName do 
    100
  end

  def score(sourceName, targetName) when sourceName != targetName do 

    if (is_anagram(sourceName, targetName)) do 
      # get letters with their index  e.g. [{"B", 0}, {"B", 1}, {"D", 2}, {"C", 3}, {"E", 4}, {"F", 5}]
      sourceChars = Enum.with_index(String.graphemes(sourceName))
      targetChars = String.graphemes(targetName)

      # group positions by letters %{"B" => [0, 1], "C" => [3], "D" => [2], "E" => [4], "F" => [5]}
      sourceCharPositions = Enum.group_by(sourceChars, fn({char, _pos}) -> char end, fn({_char, pos}) -> pos end)
 
      {newCharPositions, _} = Enum.reduce(targetChars, {[], sourceCharPositions} , fn(char, acc) ->
          find_and_pop_position(acc, char) end)

      moveCount = count_wrong_orders(newCharPositions)
      if moveCount < 20, do: 100 - 5 * moveCount, else: 0
    else 
      0
    end
  end

  defp is_anagram(source, target) do
    sort_word(source) == sort_word(target)
  end

  defp sort_word(word) do
    String.codepoints(word) |> Enum.sort
  end

  defp find_and_pop_position({targetCharPositions, sourceCharPositions}, char) do
    positions = Map.fetch!(sourceCharPositions, char)
    {targetCharPositions ++ [hd(positions)], %{sourceCharPositions | char => tl(positions)}}
  end

  defp count_wrong_orders([base | remainder]) do
    {_base, wrong_count} = Enum.reduce(remainder, {base, 0}, fn(pos, {base, count}) -> if (pos < base), do: {base, count + 1}, else: {base, count} end)
    wrong_count + count_wrong_orders(remainder)
  end

  defp count_wrong_orders(_any), do: 0 

end
