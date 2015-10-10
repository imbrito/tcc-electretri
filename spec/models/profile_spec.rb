require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { FactoryGirl.create(:profile) }
  it "@profile" do
    expect("Profile A").to eq(profile.name)
    expect("This profile is excellent!").to eq(profile.description)
    expect("Hello World").to eq(profile.project.name)
  end
end
