class Baggage
  def initialize(id:, weight:)
    @id = id.to_i
    @weight = weight.to_i
  end

  attr_reader :id, :weight

  def valid?
    # NOTE: 一応IDとweightは正の数であることは担保しておく
    @id.positive? && weight.positive?
  end
end
