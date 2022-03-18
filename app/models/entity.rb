class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_transactions, dependent: :destroy, foreign_key: :entity_id
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
