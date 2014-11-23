class CreateTemas < ActiveRecord::Migration
  def up
    create_table :temas do |c|
      c.int :id
      c.int :profesor_id
      c.string :name
    end
  end

  def down
    drop_table :temas
  end
end
