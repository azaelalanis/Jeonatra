class Profile < ActiveRecord::Base
  belongs_to :topic
  belongs_to :student
end
