class Hero
  attr_accessor :strength, :health, :actions, :gold, :exp

  def initialize(attr = {})
    @strength = attr.fetch(:strength, 3)
    @health = attr.fetch(:health, 10)
    @gold = attr.fetch(:gold, 0)
    @exp = attr.fetch(:exp, 0)
    @actions = attr.fetch(:actions, {})
  end

  def activate_action(action, target)
      actions[action].activate(target)
  end

  def damage(hit)
    @health -= hit
  end

  def gain_gold(amount)
    @gold += amount
  end

  def gain_exp(amount)
    @exp += amount
  end
end