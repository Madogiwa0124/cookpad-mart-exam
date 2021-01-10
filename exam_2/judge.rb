require_relative './judge/api_strategy'
require_relative './judge/develop_strategy'

class Judge
  def initialize(blue, red)
    @red = red
    @blue = blue
  end

  attr_reader :blue, :red

  def call
    DevelopStrategy.call(red, blue) # NOTE: 開発用のMockストラテジ
    # ApiStrategy.call(red, blue) # NOTE: APIを実際に呼び出すストラテジ
  end
end
