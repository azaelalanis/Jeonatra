class CreateTemajuego < ActiveRecord::Migration
  def up
    create_table :temajuegos do |c|
      c.int :id
      c.int :tema_id
      c.int :juego_id
    end
  end

  def down
    drop_table :temajuegos
  end
end
