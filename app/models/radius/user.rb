CONSONANTS = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]
VOWELS = ["a", "e", "i", "o", "u"]

class Radius::User < ApplicationRecord
  has_many :authorization_requests, foreign_key: :radius_user_id
  has_many :post_authorizations, foreign_key: :radius_user_id
  has_many :devices, foreign_key: :radius_user_id

  def self.generate_password
    password = ""
    number_location = SecureRandom.random_number(0..5)
    capitalize_constant = SecureRandom.random_number(0..11)
    (0..20).each do |i|
      if i == 1
        password = CONSONANTS[SecureRandom.random_number(0..21)]
      end
    end
  end
end
