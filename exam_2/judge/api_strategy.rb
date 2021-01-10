require 'json'
require 'net/http'
require 'uri'

class ApiStrategy
  class InvalidResponseError < StandardError; end;
  API_BATTLE_ENDPOINT = 'https://ob6la3c120.execute-api.ap-northeast-1.amazonaws.com/Prod/battle'.freeze
  SLEEP_SEC = 5

  def self.call(red, blue)
    new(red, blue).call
  end

  def initialize(red, blue)
    @red = red
    @blue = blue
  end

  attr_reader :red, :blue

  def call
    response = api_request("#{API_BATTLE_ENDPOINT}/#{red}+#{blue}")
    raise InvalidResponseError.new(response) if has_error?(response)
    JSON.parse(response)
  rescue StandardError => e
    puts 'Error: API呼び出し時にエラーが発生しました'
    raise e
  end

  private

  def api_request(endpoint)
    # NOTE: 負荷対策のためsleepを入れる
    sleep SLEEP_SEC
    Net::HTTP.get(URI.parse(endpoint))
  end

  def has_error?(res)
    # NOTE: とりあえずmessageが含まれてたらエラーにしとく
    res.match?(/message/)
  end
end
