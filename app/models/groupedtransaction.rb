class Groupedtransaction < ApplicationRecord
  belongs_to :transaction
  belongs_to :group
end
