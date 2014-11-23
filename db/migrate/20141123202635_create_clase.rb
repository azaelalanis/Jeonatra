class CreateClase < ActiveRecord::Migration
  def up
    create_table :clases do |c|
      c.int :id
      c.int :profesor_id
      c.string :name
    end
  end

  def down
    drop_table :clases
  end
end
