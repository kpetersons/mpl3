class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.references  :user
      t.string      :name
      t.text        :description
      t.date        :start_date
      t.date        :end_date
      t.timestamps
    end
  end
end
