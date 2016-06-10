class Credential < ActiveRecord::Base
  belongs_to :role
  validates_presence_of :name, :required
  
#  def self.searchPartial(term)
#    where("name like ?", "%#{term}%")
#  end
end
