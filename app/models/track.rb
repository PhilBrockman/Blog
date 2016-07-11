class Track < ActiveRecord::Base
  belongs_to :role
  has_many :credentials
end
