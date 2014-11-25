class Topic < ActiveRecord::Base
  belongs_to :professor
  has_many :categories

  def show_url
    return "/topics/#{self.id}/categories"
  end

  def edit_url
    return "/topics/#{self.id}/edit"
  end

  def delete_url
    return "/topics/#{self.id}/delete"
  end
end
