require 'rails_helper'

RSpec.describe Alternative, type: :model do
  let(:alternative) { FactoryGirl.build(:alternative) }
  
  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:performances) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:project_id) }

  it "@alternative" do
    expect("Alternative A").to eq(alternative.name)
    expect("This first alternative!").to eq(alternative.description)
    expect("Hello World").to eq(alternative.project.name)
  end
end
