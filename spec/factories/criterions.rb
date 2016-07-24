FactoryGirl.define do
  factory :criterion, class: Criterion do
    name 'Criterion 01'
    weight 0.3
    preference 0.6
    indifference 0.4
    veto 0.5
    direction 'Up'
    association :project, factory: :project
  end

  factory :invalid_criterion, class: Criterion do
    name nil
    weight nil
    preference nil
    indifference nil
    veto nil
    direction nil
    # association :project, factory: :project
  end
end
