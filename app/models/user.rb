class User < ApplicationRecord
  before_create :add_unsubscribe_hash
  # we might want to add the relation below
  has_many :submissions, dependent: :destroy
  has_many :communities
  has_many :comments
  has_many :subscriptions, dependent: :destroy
  has_many :communities, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true

  has_many :subscribed_submissions, through: :communities, source: :submissions

  acts_as_voter

  private

    def add_unsubscribe_hash
      self.unsubscribe_hash = SecureRandom.hex
    end
end
