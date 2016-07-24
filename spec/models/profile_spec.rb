require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { FactoryGirl.build(:profile) }

  it { is_expected.to belong_to(:project) }
  it { is_expected.to have_many(:performances) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_uniqueness_of(:name).scoped_to(:project_id) }

  it '@profile' do
    expect('Profile A').to eq(profile.name)
    expect('This profile is excellent!').to eq(profile.description)
    expect('Hello World').to eq(profile.project.name)
  end
end
