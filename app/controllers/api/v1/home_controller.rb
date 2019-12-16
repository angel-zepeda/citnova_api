class Api::V1::HomeController < ApplicationController
  before_action :authenticate_user, only: [:auth]
  def index
    render json: {status: 200, msg: "Wellcome to index"}
  end

  def auth
    render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}" }
  end
end
