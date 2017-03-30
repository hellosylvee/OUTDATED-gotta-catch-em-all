require_relative '../config/environment.rb'
require_relative "../lib/command_line_interface.rb"
require_relative "../lib/api_communicator.rb"

welcome
puts "what's your name?"
name = gets.chomp
user = User.find_or_create_by(name: name)
user.pokemons << pokemon
pokemon = get_pokemon_name_from_user
give_stats_to_user(pokemon)


cli.welcome
#user_name = cli.enter_name
#cli.create_user(user_name)
pokemon = cli.get_pokemon_name_from_user
cli.give_stats_to_user(pokemon)

# cli = CommandLineInterface.new
# cli.welcome
# pokemon = cli.get_pokemon_name_from_user
# cli.give_stats_to_user(pokemon)

