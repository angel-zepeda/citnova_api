class Api::V1::ComplainsController < ApplicationController
  before_action :authenticate_user
  before_action :set_complain, only: [:update, :destroy]
  
  def index
    @complains = Complain.joins(:user, :area).select(:body, :username, :name)
    @complain = @complains.where.not(body: 'null')
    render json: @complain
  end

  def show
    @complains = Complain.joins(:user, :area).select(:body, :username, :name)
    @complain = @complains.where(area_id: params[:id])
    render json: @complain
  end

  def create
    @user = current_user
    @complains = @user.complains.build(complains_params)
    if @complains.save
      render json: [msg: "Complain created"]
    else
      render json: {status: 422, msg: @complains_params.errors}
    end
  end

  def update
    if @complain.update(complains_params)
      render json: {status: 200, msg: "Complain #{@complain.id} has been updated."}
    else
      render json: {status: 422, msg: @complain.errors}
    end
  end

  def destroy
    if @complain.destroy
      render json: {status: 200, msg: "Complain #{@complain.id} has been destroyed."}
    else
      render json: {status: 422,msg: @complain.errors}
    end
  end

  private

  def set_complain
    @complain = Complain.find(params[:id])
  end

  def complains_params
    params.require(:complain).permit(:body, :area_id)
  end

end
