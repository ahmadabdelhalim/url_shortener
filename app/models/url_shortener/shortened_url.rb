class UrlShortener::ShortenedUrl < ActiveRecord::Base
  validates :full_link, presence: true
  after_create :create_shortened_link
  after_validation :smart_add_url_protocol

  private
  # Total: 26 + 26 + 10 = DICT_SIZE chars
  CHAR_TO_NUMBER_DICT = [*('a'..'z'), *('A'..'Z'), *('0'..'9')]
                      .each_with_index
                      .to_h
  NUMBER_TO_CHAR_DICT = CHAR_TO_NUMBER_DICT.invert
  DICT_SIZE = CHAR_TO_NUMBER_DICT.size
      
  def create_shortened_link
    self.shortened_link = generate_shortened_link
    save
  end
    
  def generate_shortened_link
    generated = ""
    n = self.id
    while n != 0
      m = n % DICT_SIZE
      generated << NUMBER_TO_CHAR_DICT[m]
      n = n / DICT_SIZE
    end
    generated.reverse
  end

  # in case user didn't input http:// or https://
  def smart_add_url_protocol
    unless self.full_link and (self.full_link[/\Ahttp:\/\//] || self.full_link[/\Ahttps:\/\//])
      self.full_link = "http://#{self.full_link}"
    end
  end
end