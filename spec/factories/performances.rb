FactoryGirl.define do
  factory :performance_profile, class: Performance do
    value 1.5
    association :criterion, factory: :criterion
    association :performable, factory: :profile
  end

  factory :performance_alternative, class: Performance do
    value 2.5
    association :criterion, factory: :criterion
    association :performable, factory: :alternative
  end

  factory :performance, class: Performance do
    value 2.5
  end

  factory :invalid_performance, class: Performance do
    value nil
  end
end
