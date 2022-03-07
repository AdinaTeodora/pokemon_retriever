defmodule PokemonRetrieverTest do
  use ExUnit.Case
  doctest PokemonRetriever

  test "greets the world" do
    assert PokemonRetriever.hello() == :world
  end
end
