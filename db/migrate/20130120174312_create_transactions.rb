class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transaction do |t|
      t.references  :user
      t.references  :accounts
      t.string      :type
      t.decimal     :amount,      :precision => 8, :scale => 2
      t.date        :date_when
      t.text        :description
      t.timestamps
    end
  end
end
