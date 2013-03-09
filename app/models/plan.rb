# == Schema Information
#
# Table name: plans
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Plan < ActiveRecord::Base

  attr_accessible :name, :description, :start_date, :end_date, :user_id

  belongs_to :user
  has_many :plan_items

  validates :user_id,     :presence => true
  validates :name,        :presence => true
  validates :name,        :uniqueness => {:scope => [:user_id]}
  validates :start_date,  :presence => true
  validates :end_date,    :presence => true


  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:plan_item_ids, :transaction_ids])
  end

  def transaction_ids
    ids = []
    plan_items.each do |pi|
      ids +=pi.transaction_ids
    end
    ids
  end

  def plan_item_ids
    plan_items.order(:category_id).map(&:id)
  end

end
