require 'rails_helper'

RSpec.describe Alternative, type: :model do
  let(:alternative) { FactoryGirl.create(:alternative) }
    it "@alternative" do
      expect("Alternative A").to eq(alternative.name)
      expect("This first alternative!").to eq(alternative.description)
      expect("Hello World").to eq(alternative.project.name)
    end
end
