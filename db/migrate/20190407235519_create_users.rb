class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :session_token, null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :users, :email
    add_index :users, :deleted_at
    add_index :users, :session_token
  end
end
