FactoryGirl.define do
  factory :project, :class => Project do
    name "Hello World"
		description "Pink and Brian, to domains the World!"
		cut 0.75
		association :user, factory: :user
  end

  factory :invalid_project, :class => Project do
    name nil
		description nil
		cut nil
		#association :user, factory: :user
  end

end
