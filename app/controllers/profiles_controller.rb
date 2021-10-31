class ProfilesController < ApplicationController
  def home; end

  def members
    @members = User.all
  end
end
