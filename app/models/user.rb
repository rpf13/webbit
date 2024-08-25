class User < ApplicationRecord

  # we might want to add the relation below
  has_many :submissions, dependent: :destroy
  has_many :communities

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
end
