FactoryGirl.define do
  factory :profile, :class => Profile do
    name "Profile A"
		description "This profile is excellent!"
		association :project, factory: :project
  end

end
