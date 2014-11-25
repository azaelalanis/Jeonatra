class Classroom < ActiveRecord::Base
  belongs_to :professor
  has_many :students
  has_many :games

  def show_url
    return "/classrooms/#{self.id}"
  end

  def edit_url
    return "/classrooms/#{self.id}/edit"
  end

  def delete_url
    return "/classrooms/#{self.id}/delete"
  end
end
