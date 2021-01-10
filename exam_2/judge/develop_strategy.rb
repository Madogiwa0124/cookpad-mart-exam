class DevelopStrategy
  class Monster
    include Comparable

    MONSTERS = {
      'vampire' => 1,
      'griffin' => 2,
      'medusa'  => 3,
      'dragon'  => 4,
      'troll'   => 5,
    }

    def initialize(name)
      @name = name
      @power = MONSTERS[name]
    end

    attr_reader :name, :power

    def <=>(other)
      power - other.power
    end
  end

  def self.call(red, blue)
    red_monster, blue_monster = Monster.new(red), Monster.new(blue)
    loser, winner = [red_monster, blue_monster].sort
    { "winner" => winner.name, "loser" => loser.name }
  end
end
