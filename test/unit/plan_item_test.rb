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

require 'test_helper'

class PlanItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
