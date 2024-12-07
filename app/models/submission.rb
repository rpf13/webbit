class Submission < ApplicationRecord
  include VotesCountable
  belongs_to :user
  belongs_to :community
  has_one_attached :media
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, length: { maximum: 8000 }
  validates :url, url: true, allow_blank: true
  validate :body_or_url
  validate :content_exists

  acts_as_votable

  private

    def body_or_url
      unless url.blank? || body.blank?
        # If both url and body are present (i.e., neither is blank),
        # the method proceeds to the next nested unless statement.
        # This statement uses the XOR (exclusive or) operator ^ to check
        # if exactly one of the url or body attributes is blank.
        # The condition unless url.blank? ^ body.blank? will be true
        # if both attributes are either present or absent.
        unless url.blank? ^ body.blank?
          errors.add(:base, "Specify a URL or a body, not both")
        end
      end
    end

    def content_exists
      if url.blank? && body.blank? && !media.attached?
        errors.add(:base, "Specify a URL, a body, or upload a media file")
      end
    end
end
