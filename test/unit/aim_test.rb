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

require 'test_helper'

class AimTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
