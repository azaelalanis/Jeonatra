class CreateProfile < ActiveRecord::Migration
  def up
    create_table :profiles do |c|
      c.integer :topic_id
      c.integer :game_id

      c.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end
