require 'rails_helper'

RSpec.describe Alternative, type: :model do
  let(:alternative) { FactoryGirl.create(:alternative) }
    it "create alternative" do
      expect("Alternative A").to eq(alternative.name)
      expect("This first alternative!").to eq(alternative.description)
      expect("Hello Word").to eq(alternative.project.name)
    end
end
