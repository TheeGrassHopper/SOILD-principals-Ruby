class Action
  def initialize(owner, dicepool)
    @owner = owner
    @dicepool= dicepool

    action_attributes
  end

  attr_accessor :owner, :dicepool, :attribute, :difficulty

  def action_attributes
    raise "You must define action_attributes"
  end

  def activate(target)
    return success(target) if dicepool.skill_check(owner.send(attribute), target.send(difficulty)) 
  failure(target)
  end

  def success
  end

  def failure
  end
end