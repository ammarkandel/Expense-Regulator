class AddIconToGroups < ActiveRecord::Migration[6.1]
  def change
    add_column :groups, :icon, :string
  end
end
