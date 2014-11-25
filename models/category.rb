class Category < ActiveRecord::Base
  has_many :clues
  belongs_to :topic

  def show_url
    return "/categories/#{self.id}"
  end

  def edit_url
    return "/categories/#{self.id}/edit"
  end

  def delete_url
    return "/categories/#{self.id}/delete"
  end
end
