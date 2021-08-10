class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(get_strong_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new
    end
  end
  def show
    @article = Article.find(params[:id])
  end
  def edit
    @article = Article.find(params[:id])
  end
  private
  def get_strong_params
    params.require(:article).permit(:title, :content)
  end
end
