class Profile < ActiveRecord::Base
  belongs_to :project
  has_many :performances, as: :performable, :dependent => :destroy
  validates :name, :description, presence: true
end
