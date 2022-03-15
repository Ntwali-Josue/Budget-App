class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.bigint :user_id
      t.string :Name
      t.string :icon

      t.timestamps
    end
    add_foreign_key :categories, :users, column: :user_id
    add_index :categories, [:user_id, :Name], unique: true
  end
end
