class MypageController < ApplicationController






  def index
    @articles = current_user.articles
   end




   def show
    @user = User.find(params[:id])
    @users = User.article(params[:id])
    @users = User.article(params[:id])
    @articles = current_user.articles

   end






end
