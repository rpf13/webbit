class Community < ApplicationRecord
  belongs_to :user
  has_many :submissions
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions
end
