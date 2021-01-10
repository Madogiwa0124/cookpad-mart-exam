require_relative './judge'

class Arena
  def initialize(monsters)
    @monsters = monsters
    @challengers = monsters.dup
    @results = []
  end

  attr_reader :monsters, :challengers, :results

  def call
    knockout_competition
    results_info
  end

  private

  # NOTE: 勝ち抜け方式でモンスターの順位付けを行うメソッド
  # ※ deleteを使っているので重複したモンスター(文字列)が渡された場合、名寄せされる
  # 例) dragon, dragon, troll => troll, dragon
  def knockout_competition
    until challengers.empty?
      champion = battle(challengers)
      results << champion
      challengers.delete(champion)
    end
    results
  end

  def battle(monsters)
    # NOTE: モンスターが1体の場合は、不戦勝で渡されたモンスターを勝ちとする
    return monsters[0] if monsters.length < 2
    judge = ->(winner, monster) { Judge.new(winner, monster).call['winner'] }
    champion, challengers = monsters[0], monsters[1..-1]
    challengers.inject(champion) { |winner, monster| judge.call(winner, monster) }
  end

  def results_info
    text = "==== RESULT ====\n"
    results.each_with_index do |result, index|
      text << "No.#{index + 1}: #{result}\n"
    end
    text
  end
end
