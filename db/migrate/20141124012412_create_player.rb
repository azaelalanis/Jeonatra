class CreatePlayer < ActiveRecord::Migration
  def up
    create_table :players do |c|
      c.integer :student_id
      c.integer :game_id
      c.integer :score
      c.timestamps
    end
  end

  def down
    drop_table :players
  end
end
