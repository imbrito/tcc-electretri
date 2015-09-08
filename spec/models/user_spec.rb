require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }

  it "create user" do
    expect("torvalds").to eq(user.password)
    expect("user").to eq(user.role.name)
  end

  it "create admin" do
    expect("admin@test.com").to eq(admin.email)
    expect("wozniack").to eq(admin.password)
    expect("admin").to eq(admin.role.name)
  end
end
