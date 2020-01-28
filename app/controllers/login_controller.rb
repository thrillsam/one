class LoginController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  end

  def create
  	user = AuthenticateUser.new(params[:email], params[:password]).call
  	if user.present?
      session[:user_id] = user.id
      redirect_to "/one/users"
    else
      render 'new', status: :unauthorized
    end
  end

  def destroy
    destroy_session
    redirect_to "/one"
  end

  private 
	  def login_params
	  	params.permit(:email, :password)
	  end

    def destroy_session
      session[:user_id] = nil
    end
end
