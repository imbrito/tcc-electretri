require 'rails_helper'

RSpec.describe Criterion, type: :model do
  let(:criterion) { FactoryGirl.build(:criterion) }

  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:performances) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:project_id) }
  it { is_expected.to validate_numericality_of(:weight).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:preference).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:indifference).is_greater_than_or_equal_to(0) }
  it { is_expected.to validate_numericality_of(:veto).is_greater_than_or_equal_to(0) }

  it "@criterion" do
    expect("Criterion 01").to eq(criterion.name)
    expect(0.3).to eq(criterion.weight)
    expect(0.6).to eq(criterion.preference)
    expect(0.4).to eq(criterion.indifference)
    expect(0.5).to eq(criterion.veto)
    expect("Up").to eq(criterion.direction)
    expect("Hello World").to eq(criterion.project.name)
  end
end
