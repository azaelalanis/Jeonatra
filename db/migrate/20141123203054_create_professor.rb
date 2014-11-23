class CreateProfessor < ActiveRecord::Migration
  def up
    create_table :professors do |c|
      c.string :name
      c.string :email
      c.string :password
      c.integer :login_attempts
      c.timestamp :blocked_time
      c.boolean :first_login

      c.timestamps
    end
  end

  def down
    drop_table :professors
  end
end
