require 'spec_helper'
require_relative '../../lib/action'


class TestAction < Action
  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end
end

describe Action do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double("dicepool") }
  let(:subject) { TestAction.new hero, dicepool }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4) }

  it_behaves_like "action"

  it "requires action_attributes to be defined" do
    expect { Action.new hero, dicepool }.to raise_error
  end

  describe "activate" do
    it "sends success message if skill check is true" do
      allow(dicepool).to receive(:skill_check).and_return(true)
      expect(subject).to receive(:success).with(monster)
      subject.activate(monster)
    end

    it "sends failure message if skill check is false" do
      allow(dicepool).to receive(:skill_check).and_return(false)
      expect(subject).to receive(:failure).with(monster)
      subject.activate(monster)
    end
  end
end