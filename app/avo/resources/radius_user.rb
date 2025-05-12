class Avo::Resources::RadiusUser < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.model_class = ::Radius::User
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :username, as: :text
    field :password, as: :password
    field :notes, as: :text
    field :authorization_requests, as: :has_many
    field :post_authorizations, as: :has_many
  end
end
