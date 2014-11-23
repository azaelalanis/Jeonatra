class CreateProfile < ActiveRecord::Migration
  def up
    create_table :profiles do |c|
      c.integer :tema_id
      c.integer :juego_id

      c.timestamps
    end
  end

  def down
    drop_table :profiles
  end
end
