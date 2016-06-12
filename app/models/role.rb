class Role < ActiveRecord::Base
  has_many :credentials
  
  def self.find_unique_names
    return(Role.all.uniq {|r| r.name})  
  end
end
