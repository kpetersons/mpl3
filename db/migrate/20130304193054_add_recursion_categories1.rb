class AddRecursionCategories1 < ActiveRecord::Migration
  def up
    change_table :categories do |t|
      t.integer :parent_id
    end
  end

  def down
  end
end
