class CommentsController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    load_and_authorize_resource
   def index
     @comments = Comment.all
   end
   def show 
   end	
   def create 
     @comment = Comment.new(comment_params)
     @comment.user_id = current_user.id 
    #  binding.pry
    #  @comment.article_id = Article.article_id
     if @comment.save
       redirect_to article_path(@comment.article.id)
     end
  end
        def edit
        end
    
        def update
            if @comment.save (comment_params)
                redirect_to article_path(@comment.article.id)
            end
        end
    
        def destroy
            if @comment.destroy 
            redirect_to article_path(@comment.article.id)
            end 
        end
    
    private
        def comment_params
            params.require(:comment).permit(:title,:body,:article_id,:user_id)
        end
        def set_article
            @comment = Comment.find(params[:id])
        end
    
    end

