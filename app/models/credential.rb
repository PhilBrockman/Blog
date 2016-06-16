
class Credential < ActiveRecord::Base

  has_many :role_credentials
  has_many :roles, :through => :role_credentials

  has_many :teacher_credentials

  accepts_nested_attributes_for :roles

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  

end
