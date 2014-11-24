class Topic < ActiveRecord::Base
  belongs_to :professor
  has_many :categories

  def show_url do
    return "/topics/#{self.id}/categories"
  end

  def edit_url do
    return "/topics/#{self.id}/edit"
  end

  def delete_url do
    return "/topics/#{self.id}/delete"
  end
end
