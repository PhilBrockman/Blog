
class Credential < ActiveRecord::Base
#  include Bootsy::Container

  has_many :role_credentials
  has_many :roles, :through => :role_credentials

  has_many :teacher_credentials, dependent: :destroy 

  accepts_nested_attributes_for :roles

  validates :name, presence: true, length: { minimum: 3 }, uniqueness: true
  

end
