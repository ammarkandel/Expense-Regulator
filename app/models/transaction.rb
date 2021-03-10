class Transaction < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  scope :total_amount, -> { sum(:amount) }
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  has_many :groupedtransactions
  has_many :groups, through: :groupedtransactions
end
