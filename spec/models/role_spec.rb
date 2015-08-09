require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:roleuser) { FactoryGirl.create(:roleuser) }
  let(:roleadmin) { FactoryGirl.create(:roleadmin) }
  
  it "create role user" do
    expect("user").to eq(roleuser.name)
  end

  it "create role admin" do
    expect("admin").to eq(roleadmin.name)
  end
end
