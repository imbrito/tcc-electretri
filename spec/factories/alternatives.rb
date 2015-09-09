FactoryGirl.define do
  factory :alternative, :class => Alternative do
    name "Alternative A"
    description "This first alternative!"
    association :project, factory: :project
  end

end
