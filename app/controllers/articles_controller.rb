class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def show
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create 
    # render plain: params[:article]
    # ! cant use params[:article] to pass in info because it has to be white listed
    @article = Article.new(article_params)
    @article.user = User.first
    # render plain: @article.inspect
    # @article.save
    # *wouldnt work if length settings set werent met 
    # * should make an error on submit
    # redirect_to @article
    if @article.save
      flash[:notice] = 'Article was created!'
      redirect_to @article
    else
      render 'new'
    end

  end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated!'
      redirect_to @article
    else
      render 'edit'
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description, category_ids: [])
  end
end