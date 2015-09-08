class Performance < ActiveRecord::Base
  belongs_to :criterion
  belongs_to :performable, polymorphic: true
  validates :value, :numericality => { :greater_than_or_equal_to => 0 }
end
