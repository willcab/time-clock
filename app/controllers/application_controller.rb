class ApplicationController < ActionController::Base
  include Pagy::Backend
  include Authentication
  add_flash_types :success, :warning, :danger, :info
end
