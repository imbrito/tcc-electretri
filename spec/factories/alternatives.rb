FactoryGirl.define do
  factory :alternative, class: Alternative do
    name 'Alternative A'
    description 'This first alternative!'
    association :project, factory: :project
  end

  factory :invalid_alternative, class: Alternative do
    name nil
    description nil
    # association :project, factory: :project
  end
end
