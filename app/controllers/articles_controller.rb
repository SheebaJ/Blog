class ArticlesController < ApplicationController
    def index
        @articles=Article.all
    end
    def new
        @article=Article.new
    end
    def create
        @article=Article.new
        @article.title = params["article"]["title"]
        @article.body = params["article"]["body"]
        @article.category_id = params["article"]["category_id"]
        if @article.save
            redirect_to @article
        else
        end
    end
    def show
        @article=Article.find(params[:id])
    end
    def edit
        @article=Article.find(params[:id])
    end
    def update
        @article=Article.find(params[:id])
        @article.title = params["article"]["title"]
        @article.body = params["article"]["body"]
        if @article.save
            redirect_to @article
        else
        end
    end
    def destroy
        @article=Article.find(params[:id])
        if @article.destroy
            redirect_to @article
        else
        end
    end   
end
