class Expense < ApplicationRecord
  validates :name, presence: true
  validates_numericality_of :amount, greater_than: 0, numericality: true

  belongs_to :user
  has_many :expense_groups
  has_many :groups, through: :expense_groups

  scope :total_amount, -> { sum(:amount) }

  scope :none_grouped_expenses, -> { where('expenses.id NOT IN (?)', ExpenseGroup.distinct.pluck(:expense_id)) }
end
