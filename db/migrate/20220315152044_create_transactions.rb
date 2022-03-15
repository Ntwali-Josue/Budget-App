class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.bigint :AuthorId
      t.string :Name
      t.integer :Amount

      t.timestamps
    end
    add_foreign_key :transactions, :users, column: :AuthorId
    add_index :transactions, [:AuthorId, :Name], unique: true
  end
end
