defmodule NameScorerTest do
  use ExUnit.Case
  doctest NameScorer

  test "exact match returns 100" do
    assert NameScorer.score("ABCDEF", "ABCDEF") == 100
  end

  test "Not an anagram" do
    assert NameScorer.score("ABDCEF", "BBCDEF") == 0
  end

  test "1 swap required returns 95" do
    assert NameScorer.score("BBDCEF", "BBCDEF") == 95
  end

  test "swap of ambiguous letter returns 95" do
    assert NameScorer.score("HARRIS", "HARIRS") == 95
    assert NameScorer.score("HARRIS", "HRARIS") == 95
  end

  test "2 simple swaps required returns 90" do
    assert NameScorer.score("BACDFE", "ABCDEF") == 90
  end

  test "2 linked swaps required returns 90" do
    assert NameScorer.score("ABCFDE", "ABCDEF") == 90
  end

  test "swap of ANNE to ENNA returns 75" do
    assert NameScorer.score("ANNE", "ENNA") == 75
  end

  test "6 unique characters reversed returns 25" do
    assert NameScorer.score("FEDCBA", "ABCDEF") == 25
  end

  test "7 unique characters reversed returns 0" do
    assert NameScorer.score("GFEDCBA", "ABCDEFG") == 0
  end


end
