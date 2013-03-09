class CreateTargets < ActiveRecord::Migration
  def change
    create_table :targets do |t|
      t.references  :user
      t.references  :category
      t.references  :group
      t.decimal     :amount,                    :precision => 8, :scale => 2
      t.string      :name
      t.date        :target_date
      t.date        :from_date
      t.boolean     :complete
      t.date        :complete_date
      t.timestamps
    end
  end
end
