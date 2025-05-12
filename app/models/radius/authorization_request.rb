class Radius::AuthorizationRequest < ApplicationRecord
  belongs_to :radius_user, optional: true, class_name: "Radius::User"
  enum :authorization_status, {no_user: 0, found_user: 1, password_correct: 2, password_wrong: 3, password_no_user: 4}
end
