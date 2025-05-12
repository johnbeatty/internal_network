class Radius::PostAuthorization < ApplicationRecord
  belongs_to :radius_user, optional: true, class_name: "Radius::User"
  enum :authorization_status, {no_user: 0, user_authorized: 1}
end
