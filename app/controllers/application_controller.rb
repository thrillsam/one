class ApplicationController < ActionController::Base
	rescue_from Exception, :with => :render_404

	before_action :authorized
	helper_method :current_user
	helper_method :logged_in?

	def current_user   
		Rails.logger.info "$$$$$$$$$$$$$$$"
		Rails.logger.info session[:user_id]
		Rails.logger.info "$$$$$$$$$$$$$$$"
    	User.find_by(id: session[:user_id])  
	end

	def logged_in?
    	!current_user.nil?  
	end

	def authorized
	   redirect_to "/one/users" unless logged_in?
	end

	private
	  def render_404(exception = nil)
	    if exception
	        logger.info "Rendering 404: #{exception.message}"
	    end
	      
	    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
	  end
end