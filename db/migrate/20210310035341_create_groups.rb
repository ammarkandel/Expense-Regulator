class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon
      t.belongs_to :creator, foreign_key: { to_table: :users }, index: true, null: false
      t.timestamps
    end
  end
end
