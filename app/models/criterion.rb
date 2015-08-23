class Criterion < ActiveRecord::Base
  belongs_to :project
  validates :name, presence: true
  validates :weigth, :preference, :indifference, :veto, :numericality => { :greater_than_or_equal_to => 0 }
end
