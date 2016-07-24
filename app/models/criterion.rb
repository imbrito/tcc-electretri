class Criterion < ActiveRecord::Base
  belongs_to :project
  has_many :performances, dependent: :destroy
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :project_id
  validates :weight, :preference, :indifference, :veto, numericality: { greater_than_or_equal_to: 0 }
end
