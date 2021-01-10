class Truck
  def initialize(id:)
    @id = id
    @baggages = []
  end

  attr_reader :id
  attr_accessor :baggages

  def weight
    # NOTE: 箱の重さ等は考えず単純に荷物の重さの総重量を積載重量とする
    baggages.map(&:weight).sum
  end

  def info_text
    "truck_#{id}:#{baggages.map(&:id).join(',')}"
  end
end
