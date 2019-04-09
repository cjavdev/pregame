class CreatePersonas < ActiveRecord::Migration[5.2]
  def change
    create_table :personas do |t|
      t.string :name, null: false
      t.text :profile
      t.string :goals
      t.string :industry
      t.references :user, foreign_key: true
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :personas, :deleted_at
  end
end
