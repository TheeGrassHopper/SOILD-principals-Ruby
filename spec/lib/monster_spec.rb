require 'spec_helper'
require_relative '../../lib/monster'

describe Monster do
  let(:monster) { Monster.new toughness: 3, damage: 4, notice: 1, gold: 10, exp: 20 }
  context "when initialized" do
    it "has attribute toughness" do
      expect(monster.toughness).to eq(3)
    end

    it "has damage" do
      expect(monster.damage).to eq(4)
    end

    it "has notice" do
      expect(monster.notice).to eq(1)  
    end

    it "has gold" do
      expect(monster.gold).to eq(10)  
    end

    it "has exp" do
      expect(monster.exp).to eq(20)  
    end

    it "is alive on initialization" do
      expect(monster.dead?).to be_falsey
    end

    it "can be killed" do
      monster.kill
      expect(monster.dead?).to be_truthy
    end
  end
end
