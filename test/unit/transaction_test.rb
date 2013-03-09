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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
