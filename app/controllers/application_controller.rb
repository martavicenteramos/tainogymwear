class ApplicationController < ActionController::Base
  before_action :set_user, only: [:index]
  before_action :authenticate_user!
end
