class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new; end

  def create
    Article.create(
      title: params[:title],
      content: params[:content],
      published: params[:published]
    )
    redirect_to articles_path
  end
end
