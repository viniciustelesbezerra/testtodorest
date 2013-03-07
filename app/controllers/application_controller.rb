class ApplicationController < ActionController::Base
  	protect_from_forgery
  	respond_to :html, :json
  	before_filter :authenticate_user!

  	private
  	def set_flash_message(message, type)
    	flash[type.to_sym] = message
  	end

end
