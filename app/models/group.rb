class Group < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :icon, presence: true

  belongs_to :user
  has_many :expense_groups
  has_many :expenses, through: :expense_groups
end
