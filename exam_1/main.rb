require_relative './baggage'
require_relative './truck'
require_relative './truck_allocator'

baggages = ARGV.map do |arg|
  id, weight = arg.split(':')
  Baggage.new(id: id, weight: weight)
end

# NOTE: 無効な荷物は対象外にしとく
valid_baggages = baggages.select(&:valid?)
trucks = Array.new(3) { |index| Truck.new(id: index + 1) }
puts TruckAllocator.call(baggages: valid_baggages, trucks: trucks)
