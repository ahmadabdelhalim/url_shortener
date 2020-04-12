class UrlShortener::ShortenedUrl < ActiveRecord::Base
  validates :full_link, presence: true
end