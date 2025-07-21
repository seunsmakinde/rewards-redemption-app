class RenameRewardFields < ActiveRecord::Migration[8.0]
  def change
    rename_column :rewards, :name, :title
    rename_column :rewards, :points_required, :cost
  end
end
