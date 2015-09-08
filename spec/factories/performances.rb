FactoryGirl.define do
  factory :performance, :class => Performance do
    value 1.5
		association :criterion, factory: :criterion
		association :performable, factory: :profile
  end

end
