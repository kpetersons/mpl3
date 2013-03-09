# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  account_id  :integer
#  type        :string(255)
#  amount      :decimal(8, 2)
#  date_when   :date
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Transaction < ActiveRecord::Base
  self.inheritance_column='inh_type'
  attr_accessible :user_id, :account_id, :category_id, :type, :amount, :date_when, :description

  belongs_to :user
  belongs_to :account
  belongs_to :category

  validates :user_id,     :presence => true
  validates :account_id,  :presence => true
  validates :category_id, :presence => true
  validates :amount,      :presence => true
  validates :date_when,   :presence => true
  validates :type, :inclusion => { :in => %w(income expense)}

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at])
  end

end
