class CreatePista < ActiveRecord::Migration
  def up
    create_table :pistas do |c|
      c.int :id
      c.int :categoria_id
      c.int :valor
      c.string :descripcion
      c.string :correcta
      c.string :incorrecta1
      c.string :incorrecta2
    end
  end

  def down
    drop_table :pistas
  end
end
