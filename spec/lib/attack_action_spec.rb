require 'spec_helper'
require_relative '../../lib/attack_action'

describe AttackAction do
  let(:hero) { double("hero", strength: 3) }
  let(:action) { AttackAction.new hero, dicepool }
  let(:dicepool) { double("dicepool") }

  describe "activate" do
    it "makes strength check against target toughness" do
      monster = double("monster", toughness: 2)
      allow(dicepool).to receive(:skill_check).with(hero.strength, monster.toughness)
      action.activate(monster)
    end

    it "respondes to activate message" do
      expect(action).to respond_to(:activate)
    end

    it "it has an  owner" do
      expect(action.owner).to eq(hero)
    end
  end
end