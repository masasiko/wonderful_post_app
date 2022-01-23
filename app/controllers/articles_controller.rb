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
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "#{t.()}の作成完了"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "#{t('activerecord.models.article')}の編集完了"
    else
      render :edit, status: :unprocessable_entity
    end
  end



    def destroy
      @article.destroy

      respond_to do |format|
        format.html { redirect_to articles_url, notice: "#{t.()}の削除完了"}

      end
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
