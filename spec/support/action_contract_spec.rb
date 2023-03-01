shared_examples 'action' do  
  
  it "responds to activate message" do
    expect(subject).to respond_to(:activate)
  end

  it "responds to suc:success message" do
    expect(subject).to respond_to(:success)
  end

  it "responds to failure message" do
    expect(subject).to respond_to(:failure)
  end

  it "responds to owner message" do
    expect(subject).to respond_to(:owner)
  end

  it "responds to dicepool message" do
    expect(subject).to respond_to(:dicepool)
  end

  it "responds to difficulty message" do
    expect(subject).to respond_to(:difficulty)
  end

  it "responds to attribute message" do
    expect(subject).to respond_to(:attribute)
  end
end