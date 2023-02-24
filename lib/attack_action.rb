require_relative 'action'

class AttackAction < Action
  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
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