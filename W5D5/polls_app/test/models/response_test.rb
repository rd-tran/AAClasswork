# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  answer_id   :integer          not null
#
require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
