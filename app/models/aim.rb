# == Schema Information
#
# Table name: aims
#
#  id            :integer          not null, primary key
#  user_id       :integer
#  category_id   :integer
#  amount        :decimal(8, 2)
#  name          :string(255)
#  target_date   :date
#  from_date     :date
#  complete      :boolean
#  complete_date :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Aim < ActiveRecord::Base

  attr_accessible :user_id, :category_id, :amount, :name, :target_date, :from_date, :complete, :complete_date, :target_id
  attr_accessor :transactions

  belongs_to :user
  belongs_to :category
  belongs_to :target
  has_many   :targets

  validates :name,          :presence => true
  validates :user_id,       :presence => true
  validates :category_id,   :presence => true
  validates :amount,        :presence => true
  validates :target_date,   :presence => true
  validates :from_date,     :presence => true

  def as_json(options = nil)
    super(:except => [:created_at, :updated_at], :methods => [:transaction_ids])
  end

  def transactions

  end

  def transaction_ids
    return [] unless category
    fd = from_date
    unless fd
      fd = user.created_at
    end
    td = target_date
    if complete_date and td < complete_date
      td = complete_date
    end
    category.transactions.where(:date_when => fd..td).map(&:id)
  end

end
