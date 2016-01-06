class Api::PostsController < ApplicationController
  def index
    render :json => Article.where(:published => true)
  end
end
