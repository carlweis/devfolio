class ArticlesController < ApplicationController

  def index
    @articles = Article.where(:published => true)
  end
 
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end
  
  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "New Tutorial Created <strong>#{@article.title}</strong>"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Tutorial <strong>#{@article.title}</strong> Updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      flash[:success] = "Destroyed article <strong>#{@article.title}</strong>"
      redirect_to articles_path
    else
      flash[:danger] = "Failed to destroy article <strong>#{@article.title}</strong>"
      redirect_to article_path(@article)
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :excerpt, :content_markdown, :published)
    end
end
