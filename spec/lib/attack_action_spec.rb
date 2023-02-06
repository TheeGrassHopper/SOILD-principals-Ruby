require 'spec_helper'
require_relative '../../lib/attack_action'

describe AttackAction do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double("dicepool") }
  let(:attack_action) { AttackAction.new hero, dicepool }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4) }

  describe "effect" do
    context "success" do
      before :each do
        allow(dicepool).to receive(:skill_check).and_return(true)
      end
    
      it "kills monster" do
        expect(monster).to receive(:kill)
        attack_action.activate(monster)
      end

      it "rewarts owner with exp" do
        expect(hero).to receive(:gain_exp)
        attack_action.activate(monster)
      end

      it "rewards owner with gold" do
        expect(hero).to receive(:gain_gold)
        attack_action.activate(monster)
      end
    end

    context "failure" do
      it "damages owner" do
        allow(dicepool).to receive(:skill_check).and_return(false)
        expect(hero).to receive(:damage).with(monster.damage)
        attack_action.activate(monster)
      end
    end
  end

  describe "activate" do
    it "makes strength check against target toughness" do
      monster = double("monster", toughness: 2, kill: nil, damage: nil)
      allow(dicepool).to receive(:skill_check).with(hero.strength, monster.toughness)
      attack_action.activate(monster)
    end

    it "respondes to activate message" do
      expect(attack_action).to respond_to(:activate)
    end

    it "it has an  owner" do
      expect(attack_action.owner).to eq(hero)
    end
  end
end