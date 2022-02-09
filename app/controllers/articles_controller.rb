class ArticlesController < ApplicationController


  skip_before_action :authenticate_user!, only: %i[ index show ]

  before_action :set_article, only: %i[ edit update destroy ]
  def index

    # @articles= Article.all
     @articles = Article.all.page params[:page]

  end

  def show
   @article= Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit

    # @article = article.find(params[:id])
    # if @article.user == current_user
    #     render "edit"
    #   else
    #     redirect_to articles_path
    #   end
  end


  def create
        @article = current_user.articles.new(article_params)


        if @article.save
          redirect_to @article, notice: "#{t('activerecord.models.article')}を作成しました。"
        else
          render :new, status: :unprocessable_entity
        end
      end

  # PATCH/PUT /articles/1

  def update

    if @article.update(article_params)
      redirect_to @article, notice: "#{t('activerecord.models.article')}を編集しました。"
    else
      render :edit, status: :unprocessable_entity
    end
    # @article = article.find(params[:id])
    # if @article.user == current_user
    #     render "update"
    #   else
    #     redirect_to articles_path
    #   end
  end

  # DELETE /articles/1
  # def destroy
  #   @article.destroy
  #   edirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
    def destroy
      @article.destroy

      redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
    #   @article = article.find(params[:id])
    # if @article.user == current_user
    #     render "create"
    #   else
    #     redirect_to articles_path
    #   end
     end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = current_user.articles.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
  end

  private
    def baria_user
      unless User.find_by(public_uid: params[:id]).user_id == current_user.id
        flash[:notice] = "権限がありません"
        redirect_to posts_path
      end
    end
