class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
        @article = current_user.articles.new(article_params)
        @article.user_id = current_user.id
        if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
        if @article.save
            redirect_to articles_path
        else
            render action: "new"
        end
    end
    def show
    end
    def edit
    end
    def update
       if @article.update_attributes(article_params)
            redirect_to articles_path
        else
        end
    end
    def destroy
        if @article.destroy
            redirect_to articles_path
        else
        end
    end   

private
  def article_params
    params[:article].permit(:title,:body,:is_published,:publish_date,:feature_image_url,:category_id,:slug)
  end
  def set_article
	@article = Article.friendly.find(params[:id])
  end
end