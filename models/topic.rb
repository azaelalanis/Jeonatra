class Topic < ActiveRecord::Base
  belongs_to :professor
  has_many :categories
end
