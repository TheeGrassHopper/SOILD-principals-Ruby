require 'spec_helper'
require_relative '../../lib/action'


class TestAction
  include Actionable

  def action_attributes
    @attribute = :strength
    @difficulty = :toughness
  end
end

describe Actionable do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double("dicepool") }
  let(:subject) { TestAction.new hero }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4) }

  it_behaves_like "action"

  it "requires action_attributes to be defined" do
    expect { Action.new hero }.to raise_error
  end

  describe "activate" do
    before { allow(Dicepool).to receive(:new).and_return(dicepool) }
    
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