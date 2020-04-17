require_relative '../config/environment'
require_relative '../lib/cli'
require "pry"

ActiveRecord::Base.logger = nil

cli = CommandLineInterface.new

puts "Welcome to Stonks, the best resource for stock prices!"
puts "---------------------------------------------------------"

puts "What would you like to do?"
puts "View  Create  Update  Delete"
user_input = gets.chomp.downcase

while user_input != "exit"

    if user_input == "view"
        cli.viewSelection
    elsif user_input == "create"
        cli.createSelection
    elsif user_input == "update"
        cli.updateSelection
    elsif  user_input == "delete"
        cli.deleteOptions
    end

    cli.waitForEnter

    puts "\e[H\e[2J"
    user_input = cli.endRepeat

end 
# cli.run
# binding.pry
