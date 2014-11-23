class CreateCategoria < ActiveRecord::Migration
  def up
    create_table :categorias do |c|
      c.int :id
      c.int :tema_id
      c.string :name
    end
  end

  def down
    drop_table :categorias
  end
end
