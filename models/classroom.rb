class Classroom < ActiveRecord::Base
  belongs_to :professors
  has_many :students
end
