# == Schema Information
#
# Table name: responses
#
#  id          :bigint           not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  answer_id   :integer          not null
#
class Response < ApplicationRecord
  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_id,
    primary_key: :id
end
