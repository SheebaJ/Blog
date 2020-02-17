class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    load_and_authorize_resource

    def index
        @user = current_user
        @articles = Article.all
    end
    def new
        @article = Article.new
    end
    def create
      
        @article = Article.friendly.new(article_params)
        @article.user_id = current_user.id
        @article.feature_image_url = params['article']['feature_image_url']
        if @article.publish_date <= Date.today
			    @article.is_published = true
		    else
			    @article.is_published = false
        end
        if @article.save
            if not current_user.permissions.exists?(role_id:3) and not current_user.permissions.exists?(role_id:2)
                @permission = Permission.new
                @permission.user_id = current_user.id
                @permission.role_id = 3
                if not @permission.save
                  redirect_to errors_path
                end
            end
            redirect_to articles_path
        else  
        end
    end
    def show
        @comment = Comment.new
    end
    def edit
    end
    def update
        
        @article = Article.friendly.find(params[:id])
        @article.title = params['article']['title']
        @article.body = params['article']['body']
        @article.category_id = params['article']['category_id']
        @article.publish_date = params['article']['publish_date']
        @article.user_id = current_user.id
        if not params['article']['feature_image_url'].nil?
            @article.feature_image_url = params['article']['feature_image_url']
          end
          if @article.publish_date <= Date.today
            @article.is_published = true
          elsif @article.publish_date > Date.today
            @article.is_published = false
          end
      
       if @article.save
            redirect_to articles_path(@article.id)
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