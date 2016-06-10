class Credential < ActiveRecord::Base
  belongs_to :role
  validates_presence_of :name, length: { minimum: 3 }
  
#  def self.searchPartial(term)
#    where("name like ?", "%#{term}%")
#  end
end
