class Hero
  attr_accessor :strength, :health, :actions

  def initialize(attr = {})
    @strength = attr.fetch(:strength, 3)
    @health = attr.fetch(:health, 10)
    @actions = attr.fetch(:actions, {})
  end

  def activate_action(action, target)
      actions[action].activate(target)
  end
end