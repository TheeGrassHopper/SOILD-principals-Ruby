class AttackAction

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool= dicepool
  end

  attr_accessor :owner, :dicepool

  def activate(target)
    dicepool.skill_check(owner.strength, target.toughness)
  end
end