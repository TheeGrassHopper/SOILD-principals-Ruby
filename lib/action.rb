require_relative 'dicepool'

module Actionable
  def initialize(owner = nil)
    @owner = owner
    @dicepool = Dicepool.new

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

  def success(target)
  end

  def failure(target)
  end
end