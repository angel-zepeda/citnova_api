class Api::V1::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token

  rescue_from Knock.not_found_exception_class_name, with: :bad_request

  # excepcion email-password al logearse
  def bad_request
    render json: [ status: 401,
                   msg: "Invalid email address or password" 
    ]
  end

  def create
    @user = User.find_by(email: params[:auth][:email])
    data = {username: @user.username, role: @user.role}
    if @user 
      render json: [
        auth_token.token,
        data
      ] 
    else
      bad_request
    end
  end

end
