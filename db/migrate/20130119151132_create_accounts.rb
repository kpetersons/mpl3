class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references  :user
      t.string      :name
      t.text        :description
      t.date        :end_date
      t.boolean     :default
      t.timestamps
    end
  end
end
