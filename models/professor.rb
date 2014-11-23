class Professor < ActiveRecord::Base
  has_many :classrooms
  has_many :topics
end
