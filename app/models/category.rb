# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  description :string(255)
#  type        :string(255)
#  end_date    :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Category < ActiveRecord::Base

  self.inheritance_column='inh_type'
  attr_accessible :user_id, :name, :description, :type, :plan_item_ids, :end_date, :parent_id

  belongs_to :user
  belongs_to :parent, :class_name => 'Category', :foreign_key => :parent_id
  has_many   :children, :class_name => 'Category', :foreign_key => :parent_id
  has_many :transactions

  validates :user_id,     :presence => true
  validates :name, :presence => true
  validates :name, :uniqueness => {:scope => [:user_id, :type]}
  validates :type, :inclusion => { :in => %w(income expense group)}

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:transaction_ids, :plan_item_ids, :category_target_ids, :child_ids])
  end

end
