class Category < ActiveRecord::Base
  has_many :clues
  belongs_to :topics
end
