require_relative "db/connection"
require_relative "models/pokemon"
require_relative "models/trainer"

puts "There are #{Pokemon.count} pokemon"
puts "There are #{Trainer.count} trainers"

puts "*" * 50

puts "The first pokemon is at #{Pokemon.first.name}."

binding.pry

puts "ignore this line, it's just here so the binding.pry above works"
