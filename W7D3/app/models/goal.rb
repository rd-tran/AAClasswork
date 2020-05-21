class Goal < ApplicationRecord

  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :description, presence: true
  validates :user_id, presence: true

  belongs_to :user

end
