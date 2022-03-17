class Category < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :category_transactions, dependent: :destroy, foreign_key: :category_id

  validates :name, presence: true
  validates :icon, presence: true
end
