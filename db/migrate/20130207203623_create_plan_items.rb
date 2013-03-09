class CreatePlanItems < ActiveRecord::Migration
  def change
    create_table :plan_items do |t|
      t.references  :user
      t.references  :plan
      t.references  :category
      t.decimal     :amount,      :precision => 8, :scale => 2
      t.timestamps
    end
  end
end
