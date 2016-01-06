class CommentsController < ApplicationController
  http_basic_authenticate_with name: "codedevise", password: "!Zeke092600", only: [:destroy]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    flash[:success] = "You're comment has been added."
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      flash[:success] = 'Comment has been removed.'
      redirect_to article_path(@article)
    else
      flash[:danger] = 'Faild to remove comment'
      redirect_to article_path(@article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :email, :favorite, :body, :rating)
  end
end
