class Game < ActiveRecord::Base
  belongs_to :classroom
  has_many :topic, :through => :profile
  has_many :students, :through => :players
end
