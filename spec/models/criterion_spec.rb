require 'rails_helper'

RSpec.describe Criterion, type: :model do
  let(:criterion) { FactoryGirl.create(:criterion) }
  it "create criterion" do
    expect("Criterion 01").to eq(criterion.name)
    expect(0.3).to eq(criterion.weigth)
    expect(0.6).to eq(criterion.preference)
    expect(0.4).to eq(criterion.indifference)
    expect(0.5).to eq(criterion.veto)
    expect("Up").to eq(criterion.direction)
    expect("Hello Word").to eq(criterion.project.name)
  end
end
