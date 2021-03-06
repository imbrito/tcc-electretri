class User < ActiveRecord::Base
  # https://github.com/plataformatec/devise/wiki/How-To:-Add-a-default-role-to-a-User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :role
  has_many :projects
  before_create :set_default_role
  accepts_nested_attributes_for :role

  private

  def set_default_role
    self.role ||= Role.find_by_name('user')
  end
end
