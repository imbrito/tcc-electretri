require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { FactoryGirl.build(:project) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:criterions) }
  it { is_expected.to have_many(:profiles) }
  it { is_expected.to have_many(:alternatives) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:description) }
  it { should validate_inclusion_of(:cut).in_range(0.5..1) }

  it "@project" do
    expect("Hello World").to eq(project.name)
    expect("Pink and Brian, to domains the World!").to eq(project.description)
    expect(0.75).to eq(project.cut)
    expect("torvalds").to eq(project.user.password)
  end
end
