class Api::V1::Admin::DashboardController < ApplicationController
  before_action :authenticate_user
  authorize_resource class: false

  def index
    users = User.where.not(role: "admin")
    #render json: complains
    render json: users
    #render json: complains
  end
end
