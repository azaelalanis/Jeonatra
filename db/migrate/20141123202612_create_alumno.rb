class CreateAlumno < ActiveRecord::Migration
  def up
    create_table :alumnos do |a|
      a.int :id
      a.int :clase_id
      a.string :name
    end
  end

  def down
    drop_table :alumnos
  end
end
