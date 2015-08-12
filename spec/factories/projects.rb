FactoryGirl.define do
  factory :project, :class => Project do
    name "Hello Word"
	description "Pink and Brian, to domains the World!"
	cut 0.75
	association :user, factory: :user
  end

end
