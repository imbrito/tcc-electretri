require 'rails_helper'

RSpec.describe Project, type: :model do
  let(:project) { FactoryGirl.create(:project) }
  it "@project" do
    expect("Hello World").to eq(project.name)
    expect("Pink and Brian, to domains the World!").to eq(project.description)
    expect(0.75).to eq(project.cut)
    expect("torvalds").to eq(project.user.password)
  end
end
