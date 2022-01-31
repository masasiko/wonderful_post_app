class ArticlesController < ApplicationController


  before_action :set_article, only: %i[ show edit update destroy ]
  def index
    @articles=Article.all



  end

  def show

  end

  def new
    @article = Article.new
  end

  def edit
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
  end

  # DELETE /articles/1
  # def destroy
  #   @article.destroy
  #   edirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
    def destroy
      @article.destroy


      redirect_to articles_url, notice: "#{t('activerecord.models.article')}を削除しました。"
      end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :content)
    end
  end
