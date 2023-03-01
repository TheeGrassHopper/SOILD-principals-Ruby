require_relative '../../lib/attack_action'
require 'spec_helper'

describe AttackAction do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil) }
  let(:dicepool) { double("dicepool") }
  let(:subject) { AttackAction.new hero, dicepool }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4) }

  it_behaves_like "action"

  it "has strength as attribute" do
    expect(subject.attribute).to eq :strength
  end

  it "has toughness as difficulty" do
    expect(subject.difficulty).to eq :toughness
  end

  describe "effect" do
    context "success" do
      before :each do
        allow(dicepool).to receive(:skill_check).and_return(true)
      end
    
      it "kills monster" do
        expect(monster).to receive(:kill)
        subject.activate(monster)
      end

      it "rewarts owner with exp" do
        expect(hero).to receive(:gain_exp)
        subject.activate(monster)
      end

      it "rewards owner with gold" do
        expect(hero).to receive(:gain_gold)
        subject.activate(monster)
      end
    end

    context "failure" do
      it "damages owner" do
        allow(dicepool).to receive(:skill_check).and_return(false)
        expect(hero).to receive(:damage).with(monster.damage)
        subject.activate(monster)
      end
    end
  end
end