# == Schema Information
#
# Table name: plan_items
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  plan_id     :integer
#  category_id :integer
#  amount      :decimal(8, 2)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class PlanItem < ActiveRecord::Base

  attr_accessible :user_id, :category_id, :plan_id, :amount

  belongs_to :user
  belongs_to :plan
  belongs_to :category

  validates :user_id,     :presence => true
  validates :plan_id,     :presence => true
  validates :category_id, :presence => true

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:transaction_ids])
  end

  def transaction_ids
    fd = plan.start_date
    td = plan.end_date
    category.transactions.where(:date_when => fd..td).map(&:id)
  end

end
