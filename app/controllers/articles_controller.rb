class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
        @article = Article.new
        @article.title = params['article']['title']
        @article.body = params['article']['body']
        @article.category_id = params['article']['category_id']
        @article.published_date = params['article']['published_date']
        if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
        @article.feature_image_url = params['article']['feature_image_url']
        if @article.save
            redirect_to articles_path
        else
        end
    end
    def show
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        @article.title = params["article"]["title"]
        @article.body = params["article"]["body"]
        @article.category_id = params['article']['category_id']
        @article.published_date = params['article']['published_date']
        @article.feature_image_url = params['article']['feature_image_url']
        if @article.publish_date <= Date.today
			@article.is_published = true
		else
			@article.is_published = false
		end
        if @article.save
            redirect_to articles_path
        else
        end
    end
    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            redirect_to articles_path
        else
        end
    end   
end
