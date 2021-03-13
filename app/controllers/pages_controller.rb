class PagesController < ActionController::Base
  before_action :authenticate_user!, except: [:home]
  def home; end

  def profile; end
end
