class Transactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.text :description
      t.integer :amount
      t.belongs_to :creator, foreign_key: { to_table: :users }, index: true, null: false
    end
  end
end
