require 'spec_helper'
require_relative '../../lib/dicepool'

describe Dicepool do
  describe "skill_check" do
    let(:dicepool) { Dicepool.new }

    context "When the owner's strength is greater than the monster's toughness " do
      let(:owner) { double("owner", strength: 15) }
      let(:monster) { double("monster", toughness: 2) }

      it "returns true if number of strength is more than difficulty" do
        result = dicepool.skill_check(owner.strength, monster.toughness)
        expect(result).to be_truthy
      end
    end
    
    
    context "When the owner's strength is less than the monster's toughness " do
      let(:owner) { double("owner", strength: 2) }
      let(:monster) { double("monster", toughness: 15) }

      it "returns false if number of strength is less than difficulty" do
        result = dicepool.skill_check(owner.strength, monster.toughness)
        expect(result).to be_falsey
      end
    end
  end
end
