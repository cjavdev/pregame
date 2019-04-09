class AddCompetitionToIdeas < ActiveRecord::Migration[5.2]
  def change
    add_column :ideas, :competition, :text
    add_column :ideas, :public, :boolean, default: false
  end
end
