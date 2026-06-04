class RadiusUsersController < ApplicationController
  before_action :set_radius_user, only: [:show, :edit, :update]
  def index
    @radius_users = Radius::User.all
  end

  def show
  end

  def edit
  end

  def new
    @radius_user = Radius::User.new
    @radius_user.password = "#{SecureRandom.alphanumeric(4)}-#{SecureRandom.alphanumeric(3)}-#{SecureRandom.alphanumeric(4)}"
    @radius_user.notes = "Created on #{Date.today.strftime("%B %d, %Y")} by #{Current.user.email_address}"
  end

  def update
    @radius_user.update radius_user_params
    @radius_user.save
    redirect_to radius_users_path, notice: "#{@radius_user.username} was saved."
  end

  def create
    @radius_user = Radius::User.create radius_user_params
    redirect_to new_radius_user_path, notice: "#{@radius_user.username} was created."
  end

  protected

  def radius_user_params
    params.require(:radius_user).permit(:username, :password, :notes,
      :tunnel_medium_type, :tunnel_private_group_id, :tunnel_type,
      :mac_authentication)
  end

  def set_radius_user
    @radius_user = Radius::User.find_by_id params[:id]
  end
end
