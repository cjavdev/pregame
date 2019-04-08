class CreateIdeas < ActiveRecord::Migration[5.2]
  def change
    create_table :ideas do |t|
      t.string :theory, null: false
      t.string :question
      t.string :answers
      t.string :customer_location
      t.references :user
      t.monetize :estimated_arpa

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :ideas, :deleted_at
  end
end
