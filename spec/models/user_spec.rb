require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user)  { FactoryGirl.build(:user) }
  let(:admin) { FactoryGirl.build(:admin) }

  it { is_expected.to belong_to(:role) }
  it { is_expected.to have_many(:projects) }
  it { should accept_nested_attributes_for(:role) }

  it '@user' do
    expect('torvalds').to eq(user.password)
    expect('user').to eq(user.role.name)
  end

  it '@admin' do
    expect('admin@test.com').to eq(admin.email)
    expect('wozniack').to eq(admin.password)
    expect('admin').to eq(admin.role.name)
  end
end
