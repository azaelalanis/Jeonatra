class Professor < ActiveRecord::Base
  has_many :classrooms
  has_many :topics

  def edit_url
    "profiles/#{self.id}/edit"
  end
end
