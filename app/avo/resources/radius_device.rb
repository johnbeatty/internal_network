class Avo::Resources::RadiusDevice < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  self.model_class = ::Radius::Device
  # self.search = {
  #   query: -> { query.ransack(id_eq: params[:q], m: "or").result(distinct: false) }
  # }
  
  def fields
    field :id, as: :id
    field :radius_user, as: :belongs_to
    field :calledStationId, as: :text
    field :allowed, as: :boolean
  end
end
