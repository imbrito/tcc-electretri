require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:roleuser) { FactoryGirl.create(:roleuser) }
  let(:roleadmin) { FactoryGirl.create(:roleadmin) }
  
  it "@role User" do
    expect("user").to eq(roleuser.name)
  end

  it "@role Admin" do
    expect("admin").to eq(roleadmin.name)
  end
end
