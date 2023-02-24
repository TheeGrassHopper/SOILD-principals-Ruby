require 'spec_helper'

require_relative '../../lib/hero'

describe Hero do
  let(:dicepool) { double("dicepool") }
  let(:hero) { Hero.new }

  describe "default attributes" do  
    it "has default strength equal to 3" do
      expect(hero.strength).to eq(3)
    end

    it "has defaulth health equal to 10" do
      expect(hero.health).to eq(10)
    end

    it "has default gold equal to 0" do
      expect(hero.gold).to eq(0)
    end

    it "has defaulth exp equal to 0" do
      expect(hero.exp).to eq(0)
    end
  end

  it "can be damaged" do
    hero.damage(3)
    hero.damage(2)
    expect(hero.health).to eq(5)
  end

  it "can gain gold" do
    hero.gain_gold(10)
    hero.gain_gold(5)
    expect(hero.gold).to eq(15)
  end

  it "can gain exp" do
    hero.gain_exp(10)
    hero.gain_exp(5)
    expect(hero.exp).to eq(15)
  end

  describe "custom attributes" do
    it "can be initialized with custom strength" do
      hero = Hero.new strength: 3
      expect(hero.strength).to eq(3)
    end

    it "can be initialized with custom health" do
      hero = Hero.new health: 3
      expect(hero.health).to eq(3)
    end
  end

  describe "flee state" do
    it "is not fleeing by default" do
      expect(hero.fleeing?).to be_falsey
    end

    it "can be fleeing" do
      hero.flee
      expect(hero.fleeing?).to be_truthy
    end
  end

  describe "attack attack" do
    let(:attack_action) { double("attack_action") } 
    let(:hero) { Hero.new actions: { attack: attack_action } }

    it "has attack action" do
      expect(hero.actions[:attack]).to eq(attack_action)
    end

    it "activates attack action" do
      monster = double("monster")
      expect(attack_action).to receive(:activate)
      hero.activate_action :attack, monster 
    end
  end
end