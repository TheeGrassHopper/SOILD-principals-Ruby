require 'spec_helper'
require_relative '../../lib/flee_action'

describe FleeAction do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 3) }
  let(:dicepool) { double("dicepool") }
  let(:flee_action) { FleeAction.new hero, dicepool }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4, notice: 2) }

  describe "effect" do
  end

  describe "activate" do
    it "makes stealth check against target notice" do
      expect(dicepool).to receive(:skill_check).with(hero.stealth, monster.notice)
      flee_action.activate(monster)
    end

    it "respondes to activate message" do
      expect(flee_action).to respond_to(:activate)
    end

    it "it has an  owner" do
      expect(flee_action.owner).to eq(hero)
    end
  end
end