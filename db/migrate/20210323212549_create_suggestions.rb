class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.string :text
      t.integer :user_id
      t.timestamps
    end
  end
end
