class Game < ActiveRecord::Base
  belongs_to :classroom

  has_many :profiles
  has_many :topics, :through => :profiles

  has_many :players
  has_many :students, :through => :players
end
