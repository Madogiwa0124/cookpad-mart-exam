require_relative './arena'

monsters = ARGV
puts Arena.new(monsters).call
