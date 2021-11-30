class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create 
    # render plain: params[:article]
    # ! cant use params[:article] to pass in info because it has to be white listed
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = 'Article was updated!'
      redirect_to @article
    else
      render 'edit'
    end
  end
end