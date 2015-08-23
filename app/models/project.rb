class Project < ActiveRecord::Base
  belongs_to :user
  has_many :criterions, :dependent => :destroy
  validates :name, :description, presence: true
  validates :cut, inclusion: { in: 0.5..1 }

  CUT = %w[0.50 0.51 0.52 0.53 0.54 0.55 0.56 0.57 0.58 0.59
  		0.60 0.61 0.62 0.63 0.64 0.65 0.66 0.67 0.68 0.69
  		0.70 0.71 0.72 0.73 0.74 0.75 0.76 0.77 0.78 0.79
  		0.80 0.81 0.82 0.83 0.84 0.85 0.86 0.87 0.88 0.89
  		0.90 0.91 0.92 0.93 0.94 0.95 0.96 0.97 0.98 0.99 1]
end