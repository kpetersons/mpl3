class RenameTransactionTarget < ActiveRecord::Migration
  def up
    rename_table :transaction_targets, :aims
  end

  def down
    rename_table :aims, :transaction_targets
  end
end
