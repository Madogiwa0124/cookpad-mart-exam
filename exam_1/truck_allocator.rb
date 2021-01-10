class TruckAllocator
  def self.call(baggages:, trucks:)
    new(baggages: baggages, trucks: trucks).call
  end

  def initialize(baggages:, trucks:)
    @baggages = baggages
    @trucks = trucks
  end

  attr_reader :baggages, :trucks

  def call
    allocate
    result_text
  end

  private

  def result_text
    trucks.map(&:info_text)
  end

  def allocate
    baggages.each { |baggage| target_truck.baggages << baggage }
  end

  def target_truck
    # NOTE: 積載重量が一番少ないトラックをターゲットにする
    trucks.min { |a, b| a.weight <=> b.weight }
  end
end
