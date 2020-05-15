# == Schema Information
#
# Table name: likes
#
#  id            :bigint           not null, primary key
#  user_id       :integer          not null
#  likeable_type :string
#  likeable_id   :bigint
#
class Like < ApplicationRecord
  belongs_to :liker,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :likeable,
    polymorphic: true
end
