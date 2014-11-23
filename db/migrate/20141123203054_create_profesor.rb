class CreateProfesor < ActiveRecord::Migration
  def up
    create_table :profesores do |c|
      c.int :id
      c.string :name
      c.string :email
      c.string :password
      c.int :login_attempts
      c.timestamp :blocked_time
      c.bool :first_login
    end
  end

  def down
    drop_table :profesores
  end
end
