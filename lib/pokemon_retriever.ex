defmodule PokemonRetriever do
  use Tesla

  plug Tesla.Middleware.JSON


  @doc """
      iex> PokemonRetriever.fetch_pokemon_name(1)
           "bulbasaur"
  """
  def fetch_pokemon_name(id) do
    case get("https://pokeapi.co/api/v2/pokemon/#{id}") do
      {:ok, %Tesla.Env{status: 200, body: %{"name" => name}}} ->
        name
      {:ok, %Tesla.Env{status: 404}} ->
        "not found"
      _ ->
        "unknown error"
    end
  end

  @doc """
      iex> PokemonRetriever.fetch_pokemon_id("bulbasaur")
           1
  """
  def fetch_pokemon_id(name) do
    case get("https://pokeapi.co/api/v2/pokemon/#{name}") do
      {:ok, %Tesla.Env{status: 200, body: %{"id" => id}}} ->
        id
      {:ok, %Tesla.Env{status: 404}} ->
        "not found"
      _ ->
        "unknown error"
    end
  end

end

# to run:
#   iex -S mix
#   c("lib/pokemon_retriever.ex")