class UsersController < ApplicationController

  def show
    # @articles = current_user.articles
    @user = User.find_by(id:1)
  end

  # def after_sign_in_path_for(resource)
  #   user_path(resource.id)
  # end
end
