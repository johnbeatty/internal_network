class Radius::User < ApplicationRecord
  has_many :authorization_requests, foreign_key: :radius_user_id
  has_many :post_authorizations, foreign_key: :radius_user_id
end
