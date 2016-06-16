class Role < ActiveRecord::Base
  belongs_to :teacher
  has_many :role_credentials
  has_many :credentials, :through => :role_credentials
  
  def self.find_unique_names
    return(Role.all.uniq {|r| r.name})  
  end
end
