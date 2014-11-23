class CreateJuego < ActiveRecord::Migration
  def up
    create_table :juegos do |j|
      j.int :id
      j.int :clase_id
      j.timestamp :created_at
      j.int :alumno1_id
      j.int :alumno2_id
      j.int :alumno3_id
      j.int :alumno1_scr
      j.int :alumno2_scr
      j.int :alumno3_scr
    end
  end

  def down
    drop_table :juegos
  end
end
