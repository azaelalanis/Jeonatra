class CreateClue < ActiveRecord::Migration
  def up
    create_table :clues do |c|
      c.integer :category_id
      c.integer :value
      c.string :description
      c.string :right
      c.string :wrong1
      c.string :wrong2

      c.timestamps
    end
  end

  def down
    drop_table :clues
  end
end
