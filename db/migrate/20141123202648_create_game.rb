class CreateGame < ActiveRecord::Migration
  def up
    create_table :games do |j|
      j.integer :classroom_id
      j.integer :student1_id
      j.integer :student2_id
      j.integer :student3_id
      j.integer :student1_scr
      j.integer :student2_scr
      j.integer :student3_scr

      j.timestamps
    end
  end

  def down
    drop_table :games
  end
end
