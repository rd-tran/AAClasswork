# == Schema Information
#
# Table name: polls
#
#  id        :bigint           not null, primary key
#  author_id :integer          not null
#  title     :string           not null
#
class Poll < ApplicationRecord
  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id,
    primary_key: :id
end

# == Schema Information
#
# Table name: polls
#
#  id        :bigint           not null, primary key
#  author_id :integer          not null
#  title     :string           not null