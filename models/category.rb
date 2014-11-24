class Category < ActiveRecord::Base
  has_many :clues
  belongs_to :topic
end
