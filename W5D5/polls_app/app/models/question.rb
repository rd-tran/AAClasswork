# == Schema Information
#
# Table name: questions
#
#  id      :bigint           not null, primary key
#  poll_id :integer          not null
#  text    :string           not null
#
class Question < ApplicationRecord
end
