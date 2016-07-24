FactoryGirl.define do
  factory :roleadmin, class: Role do
    name 'admin'
  end

  factory :roleuser, class: Role do
    name 'user'
  end
end
