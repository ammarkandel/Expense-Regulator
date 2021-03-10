class Group < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :groupedtransactions
  has_many :transactions, through: :groupedtransactions
end
