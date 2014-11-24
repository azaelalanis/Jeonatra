class Classroom < ActiveRecord::Base
  belongs_to :professor
  has_many :students
  has_many :games

end
