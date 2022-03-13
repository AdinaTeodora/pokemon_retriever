defmodule PokemonRetrieverTest do
  use ExUnit.Case

  import Tesla.Mock

  # Successful test cases
  test "success pokemon name fetch" do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/1"} ->
        %Tesla.Env{status: 200, body: %{"name" => "bulbasaur"}}
    end)
    assert PokemonRetriever.fetch_pokemon_name(1) == "bulbasaur"
  end

  test "success pokemon id fetch" do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/bulbasaur"} ->
        %Tesla.Env{status: 200, body: %{"id" => 1}}
    end)
    assert PokemonRetriever.fetch_pokemon_id("bulbasaur") == 1
  end

  # Error test cases
  test "not found pokemon name fetch" do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/10000"} ->
        %Tesla.Env{status: 404}
    end)
    assert PokemonRetriever.fetch_pokemon_name(10000) == "not found"
  end

  test "not found pokemon id fetch" do
    mock(fn
      %{method: :get, url: "https://pokeapi.co/api/v2/pokemon/bulbasaur12"} ->
        %Tesla.Env{status: 404}
    end)
    assert PokemonRetriever.fetch_pokemon_id("bulbasaur12") == "not found"
  end

end
