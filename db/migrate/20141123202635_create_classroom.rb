class CreateClassroom < ActiveRecord::Migration
  def up
    create_table :classrooms do |c|
      c.integer :professor_id
      c.string :name

      c.timestamps
    end
  end

  def down
    drop_table :classrooms
  end
end
