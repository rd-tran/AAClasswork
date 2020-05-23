# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :text             not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  moderator_id :integer          not null
#
class Sub < ApplicationRecord
  validates :title,
            presence: true,
            uniqueness: { message: 'This subreddit already exists' }
  validates :description, presence: true

  belongs_to :moderator,
             primary_key: :id,
             foreign_key: :moderator_id,
             class_name: :User

  has_many :posts
end
