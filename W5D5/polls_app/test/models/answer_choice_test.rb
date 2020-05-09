# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint           not null, primary key
#  poll_id     :integer          not null
#  question_id :integer          not null
#  text        :string           not null
#
require 'test_helper'

class AnswerChoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
