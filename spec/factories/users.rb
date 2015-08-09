FactoryGirl.define do
  factory :user, :class => User do
  	email "user@test.com"
  	password "torvalds"
  	association :role, factory: :roleuser
  end

  factory :admin, :class => User do
  	email "admin@test.com"
  	password "wozniack"
  	association :role, factory: :roleadmin
  end
end
