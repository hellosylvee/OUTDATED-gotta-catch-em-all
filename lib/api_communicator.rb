require_relative "../models/pokemon.rb"

require 'json'
require 'pry'
require 'httparty'

  class ApiCommunicator
    URL = "http://pokeapi.co/api/v2/pokemon"

    def self.get_pokemons
      response = HTTParty.get("#{URL}/#{pokemon}")
      JSON.parse(response.body)
    end

    def poke_info(pokemon_name)
      api_info = self.get_pokemons(pokemon_name)
      result = {}

      result["name"] = api_info["name"]
      result["type"] = api_info["types"][0]["type"]["name"]
      result["base_xp"] = api_info["base_experience"]

      result = "#{pokemon_name.capitalize} is a type of #{result["type"]} pokemon with a base experience of #{result["base_xp"]}!"
      # {"name"=>"pikachu", "type"=>"electric", "base_xp"=>112}
    end

    def self.storePokemons
      self.get_pokemons.each do |pokemon|
        binding.pry
        Pokemon.create(name: pokemon["name"], type: pokemon["type"], base_xp: pokemon["base_experience"].to_i)
      end
    end
  end

# response = RestClient.get("https://phalt-pokeapi.p.mashape.com/pokemon",
#   {
#     "X-Mashape-Key" => "lC9qQhTl1tmshbvcCkjNA3b3WgEmp1OqHEzjsnEX23DqhR8FNa",
#     "Accept" => "application/json"
#   }
# )

# binding.pry
# "hi"
