class AddRecursion < ActiveRecord::Migration
  def up
    change_table :categories do |t|
      t.references :category
    end
    change_table :targets do |t|
      t.references :target
    end
  end

  def down
  end
end
