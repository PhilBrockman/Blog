
class Credential < ActiveRecord::Base

  has_many :role_credentials
  has_many :roles, :through => :role_credentials

  accepts_nested_attributes_for :roles

  validates_presence_of :name, length: { minimum: 3 }, uniqueness: true
  
#  def self.searchPartial(term)
#    where("name like ?", "%#{term}%")
#  end
end
