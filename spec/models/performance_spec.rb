require 'rails_helper'

RSpec.describe Performance, type: :model do
  let(:performance_profile) { FactoryGirl.create(:performance_profile) }
  it "@performance type Profile" do
    expect(1.5).to eq(performance_profile.value)
    expect("Criterion 01").to eq(performance_profile.criterion.name)
    expect("Profile A").to eq(performance_profile.performable.name)
    expect("Profile").to eq(performance_profile.performable_type)
  end

  let(:performance_alternative) { FactoryGirl.create(:performance_alternative) }
  it "@performance type Alternative" do
    expect(2.5).to eq(performance_alternative.value)
    expect("Criterion 01").to eq(performance_alternative.criterion.name)
    expect("Alternative A").to eq(performance_alternative.performable.name)
    expect("Alternative").to eq(performance_alternative.performable_type)
  end
end
