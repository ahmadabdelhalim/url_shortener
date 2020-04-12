class UrlShortener::ShortenedUrl < ActiveRecord::Base
  validates :full_link, presence: true
  after_create :create_shortened_link

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
end