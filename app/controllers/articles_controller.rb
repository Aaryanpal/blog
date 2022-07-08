class ArticlesController < ApplicationController
http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
# index
  def index
    @articles = Article.all
  end
# show
  def show
    @article = Article.find(params[:id])
  end

# New_File
  def new
    @article = Article.new
  end

# Create a Article
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

# Edit Already Created Article
  def edit
    @article = Article.find(params[:id]) 
  end

# This will Update
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

# Delete The pre Existing Blog and Comment 
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
