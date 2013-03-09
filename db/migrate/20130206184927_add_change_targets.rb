class AddChangeTargets < ActiveRecord::Migration
  def up
    remove_column :categories, :categories_id
    remove_column :targets, :targets_id
  end

  def down
  end
end
