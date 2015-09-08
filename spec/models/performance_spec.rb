require 'rails_helper'

RSpec.describe Performance, type: :model do
  let(:performance) { FactoryGirl.create(:performance) }
  it "create performance" do
    expect(1.5).to eq(performance.value)
    expect("Criterion 01").to eq(performance.criterion.name)
    expect("Profile A").to eq(performance.performable.name)
    expect("Profile").to eq(performance.performable_type)
  end
end
