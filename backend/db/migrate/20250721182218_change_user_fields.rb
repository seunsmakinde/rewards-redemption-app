class ChangeUserFields < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :email, :string
    remove_column :users, :capacity, :integer

    add_column :users, :name, :string, null: false
    add_column :users, :points, :integer, null: false, default: 0
  end
end

