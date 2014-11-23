class CreateStudent < ActiveRecord::Migration
  def up
    create_table :students do |a|
      a.integer :classroom_id
      a.string :name
      a.timestamps
    end
  end

  def down
    drop_table :students
  end
end
