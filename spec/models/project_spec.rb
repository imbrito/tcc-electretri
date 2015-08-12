require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { FactoryGirl.create(:project) }
  it "create project" do
    expect("Hello Word").to eq(project.name)
    expect("Pink and Brian, to domains the World!").to eq(project.description)
    expect(0.75).to eq(project.cut)
    expect("user@test.com").to eq(project.user.email)
  end
end
