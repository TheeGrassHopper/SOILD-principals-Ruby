require 'spec_helper'
require_relative '../../lib/wand_of_fire'


describe WandOfFire do
  let(:subject) { WandOfFire.new }
  it_behaves_like "actionable"
end