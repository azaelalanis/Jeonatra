class Category < ActiveRecord::Base
  has_many :clues
  belongs_to :topic
  after_commit :build_clues

  def show_url
    return "/categories/#{self.id}"
  end

  def edit_url
    return "/categories/#{self.id}/edit"
  end

  def delete_url
    return "/categories/#{self.id}/delete"
  end

  def build_clues
    clues.create(:value=>"200", :description=>"Pregunta 1", :right=>"Respuesta 1")
    clues.create(:value=>"400", :description=>"Pregunta 2", :right=>"Respuesta 2")
    clues.create(:value=>"600", :description=>"Pregunta 3", :right=>"Respuesta 3")
    clues.create(:value=>"800", :description=>"Pregunta 4", :right=>"Respuesta 4")
    clues.create(:value=>"1000", :description=>"Pregunta 5", :right=>"Respuesta 5")
  end
end
