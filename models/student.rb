class Student < ActiveRecord::Base
  belongs_to :classroom

  def delete_url
    return "/students/#{self.id}/delete"
  end

end
