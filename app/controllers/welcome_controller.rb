class WelcomeController < ApplicationController
  before_action :set_user, only: [:dashboard]

  def index 
  end

  def dashboard
  end
end
