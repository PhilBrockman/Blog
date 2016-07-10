class Role < ActiveRecord::Base
  belongs_to :teacher
  has_many :role_credentials, dependent: :destroy
  has_many :credentials, :through => :role_credentials, dependent: :destroy

  validates :name, uniqueness: true, :length => {minimum: 1}
  
  def self.find_unique_names
    return(Role.all.uniq {|r| r.name})  
  end


	def exams
		credentials.where(exam: true)
	end

	def certificates
		credentials.all - exams
	end
end
