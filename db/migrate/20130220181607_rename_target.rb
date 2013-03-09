class RenameTarget < ActiveRecord::Migration
  def up
    rename_table :targets, :transaction_targets
  end

  def down
    rename_table :transaction_targets, :targets
  end
end
