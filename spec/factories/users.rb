FactoryGirl.define do
  factory :user, class: User do
    sequence(:email) { |n| "user-#{n}@test.com" }
    password 'torvalds'
    association :role, factory: :roleuser
  end

  factory :admin, class: User do
    email 'admin@test.com'
    password 'wozniack'
    association :role, factory: :roleadmin
  end
end
