class CreateTopic < ActiveRecord::Migration
  def up
    create_table :topics do |c|
      c.integer :professor_id
      c.string :name

      c.timestamps
    end
  end

  def down
    drop_table :topics
  end
end
