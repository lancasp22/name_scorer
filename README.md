# NameScorer

Elixir simple word similarity check - version 1

Possible use as a technical test:
A surname consists of a single string of upper case LATIN alphabetical characters.

Write a function to evaluate an input string for similarity against a given surname that returns a score depending on the similarity.
If the strings are the same return 100 otherwise if they are not anagrams of each other then return 0. If they are anagrams of each other then calculate the minimum number of adjacent swaps in the string that are required to make the strings the same and return a score of 100 reduced by 5 for each swap required, but with a minimum score of 0.

Examples:
* ("ABCDEF", "ABCDEF") returns 100
* ("ABDCEF", "BBCDEF") returns 0
* ("BBDCEF", "BBCDEF") returns 95
* ("HARRIS", "HARIRS") returns 95
* ("HARRIS", "HRARIS") returns 95
* ("BACDFE", "ABCDEF") returns 90
* ("ABCFDE", "ABCDEF") returns 90
* ("ANNE", "ENNA") returns 75
* ("FEDCBA", "ABCDEF") returns 25
* ("GFEDCBA", "ABCDEFG") returns 0

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `name_scorer` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:name_scorer, "~> 0.1.0"}]
    end
    ```

  2. Ensure `name_scorer` is started before your application:

    ```elixir
    def application do
      [applications: [:name_scorer]]
    end
    ```

