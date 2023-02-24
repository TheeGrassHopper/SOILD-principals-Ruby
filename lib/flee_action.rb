class FleeAction
  def initialize(owner, dicepool)
    @owner = owner
    @dicepool= dicepool
  end

  attr_accessor :owner, :dicepool

  def activate(target)
    return success(target) if dicepool.skill_check(owner.stealth, target.notice)
    failure(target)
  end

  def success(target)
  end

  def failure(target)
  end
end