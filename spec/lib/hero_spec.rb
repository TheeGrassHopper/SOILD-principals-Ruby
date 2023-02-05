require 'spec_helper'

require_relative '../../lib/hero'

describe Hero do
  let(:dicepool) { double("dicepool") }

  describe "default attributes" do
    let(:hero) { Hero.new dicepool: dicepool }
    it "has default strength equal to 3" do
      expect(hero.strength).to eq(3)
    end

    it "has defaulth health equal to 10" do
      expect(hero.health).to eq(10)
    end
  end

  describe "custom attributes" do
    it "can be initialized with custom strength" do
      hero = Hero.new strength: 3, dicepool: dicepool
      expect(hero.strength).to eq(3)
    end

    it "can be initialized with custom health" do
      hero = Hero.new health: 3, dicepool: double("dicepool")
      expect(hero.health).to eq(3)
    end
  end
  describe "custom attributes" do
    it "succeeds" do
      dicepool = double("dicepool", skill_check: 3)
      hero = Hero.new dicepool: dicepool
      monster = double("monster", toughness: 2)
      expect(hero.attack(monster)).to be_truthy
    end

    it "fails" do
      dicepool = double("dicepool", skill_check: 1)
      hero = Hero.new dicepool: dicepool
      monster = double("monster", toughness: 2)
      expect(hero.attack(monster)).to be_falsey
    end
  end
end
