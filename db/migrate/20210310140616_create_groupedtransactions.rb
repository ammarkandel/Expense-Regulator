class CreateGroupedtransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :groupedtransactions do |t|
      t.belongs_to :group, foreign_key: { to_table: :groups }, index: true, null: false
      t.belongs_to :transaction, foreign_key: { to_table: :transactions }, index: true, null: false
      t.timestamps
    end
  end
end
