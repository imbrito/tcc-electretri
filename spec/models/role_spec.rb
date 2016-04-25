require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:roleuser) 	{ FactoryGirl.build(:roleuser) }
  let(:roleadmin) { FactoryGirl.build(:roleadmin) }

  it { is_expected.to have_many(:users) }
  
  it "@role User" do
    expect("user").to eq(roleuser.name)
  end

  it "@role Admin" do
    expect("admin").to eq(roleadmin.name)
  end
end
