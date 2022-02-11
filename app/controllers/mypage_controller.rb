class MypageController < ApplicationController






  def index


    articles = current_user.articles
    articles = articles.where('title LIKE ?', "%#{params[:title]}%") if  params[:title].present?

    @articles = current_user.articles.page params[:page]
    # @users = User.page(params[:page]).per(10)


   end




  #  def show
  #   @user = User.find(params[:id])
  #   @users = User.article(params[:id])
  #   @users = User.article(params[:id])
  #   @articles = current_user.articles

  #  end






end
