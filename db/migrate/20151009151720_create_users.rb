class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null:false
      t.string :password_hash, null:false #for bcrypt

      t.timestamps null:false
    end
  end
end
