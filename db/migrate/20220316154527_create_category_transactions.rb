class CreateCategoryTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transactions do |t|

      t.timestamps
    end
    add_reference :category_transactions, :category, foreign_key: true
    add_reference :category_transactions, :entity, foreign_key: true
  end
end
