class AddRecursionCategories < ActiveRecord::Migration
  def up
    change_table :categories do |t|
      t.references :category
    end
  end

  def down
  end
end
