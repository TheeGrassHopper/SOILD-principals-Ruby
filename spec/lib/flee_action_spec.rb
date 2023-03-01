require 'spec_helper'
require_relative '../../lib/flee_action'

describe FleeAction do
  let(:hero) { double("hero", strength: 3, gain_exp: nil, gain_gold: nil, damage: nil, stealth: 3) }
  let(:dicepool) { double("dicepool") }
  let(:subject) { FleeAction.new hero }
  let(:monster) { double("monster", toughness: 2, kill: nil, damage: 4, notice: 2) }


  it_behaves_like "action"
  it_behaves_like "actionable"

  it "has stealth as attribute" do
    expect(subject.attribute).to eq :stealth
  end
  
  it "has notice as difficulty" do
    expect(subject.difficulty).to eq :notice
  end

  describe "effect" do
    before { allow(Dicepool).to receive(:new).and_return(dicepool) }

    context "success" do
      it "sendds flee message to the owner" do
        allow(dicepool).to receive(:skill_check).and_return(true)
        expect(hero).to receive(:flee)
        subject.activate(monster)
      end
    end
    
    context "failure" do
      it "deals damage to the ower" do
        allow(dicepool).to receive(:skill_check).and_return(false)
        expect(hero).to receive(:damage).with(monster.damage)
        subject.activate(monster)
      end
    end
  end
end