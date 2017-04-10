defmodule NameScorerTest do
  use ExUnit.Case
  doctest NameScorer

  test "exact match returns 100" do
    assert NameScorer.score("ABCDEF", "ABCDEF") == 100
  end

  test "1 swap required returns 95" do
    assert NameScorer.score("BBDCEF", "BBCDEF") == 95
  end

  test "2 simple swaps required returns 90" do
    assert NameScorer.score("BACDFE", "ABCDEF") == 90
  end

  test "2 linked swaps required returns 90" do
    assert NameScorer.score("ABCFDE", "ABCDEF") == 90
  end

  test "6 characters reversed returns 25" do
    assert NameScorer.score("FEDCBA", "ABCDEF") == 25
  end

  test "7 characters reversed returns 0" do
    assert NameScorer.score("GFEDCBA", "ABCDEFG") == 0
  end

  test "Not an anagram" do
    assert NameScorer.score("ABDCEF", "BBCDEF") == 0
  end

end
