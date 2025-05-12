class Avo::Resources::RadiusPostAuthorization < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.model_class = ::Radius::PostAuthorization
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }

  def fields
    field :id, as: :id
    field :calledStationId, as: :text
    field :callingStationId, as: :text
    field :accountingSessionId, as: :text
    field :accountingMultiSessionId, as: :text
    field :username, as: :text
    field :authorization_status,
      as: :select,
      enum: ::Radius::PostAuthorization.authorization_statuses,
      display_with_value: true,
      placeholder: "Result"
    field :radius_user, as: :belongs_to
  end
end
