class Classroom < ActiveRecord::Base
  belongs_to :professor
  has_many :students
  has_many :games

  def show_url
    return "/classroom/#{self.id}"
  end

  def edit_url
    return "/classroom/#{self.id}/edit"
  end

  def delete_url
    return "/classroom/#{self.id}/delete"
  end
end
