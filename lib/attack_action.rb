class AttackAction

  def initialize(owner, dicepool)
    @owner = owner
    @dicepool= dicepool
  end

  attr_accessor :owner, :dicepool

  def activate(target)
    return success(target) if dicepool.skill_check(owner.strength, target.toughness)
    failure(target)
  end

  def success(target)
      owner.gain_exp
      target.kill 
      owner.gain_gold
  end

  def failure(target)
    owner.damage(target.damage)
  end
end