class CommentsController < ApplicationController
  before_action :set_commentable
        
                              
        def update  # 5 Wnosim izmenrnie w redaktirowanie
               @comment = @commentable.comments.find params[:id]
             if@comment.update(comment_params) # Obnowlaem s nowymi parametromi
               redirect_to  @commentable   #"perenaprowlenie" 
               flash[:success] = "Comment updated!" #Window Podtwerzdenija
              else
               render action: 'edit'    #"perenaprowlenie"
            end
           end
        
         def edit  # 4 Wozwrat i Redactirowanie
             @comment = @commentable.comments.find params[:id]
            end
        
          
       def new  # 3 создать - new (отобразить форму. GET)
           @comment = Comment.new
           @commentable = set_commentable
          end
        
       def create# 1: create (отправить форму. POST)  
             @commentable = set_commentable
             @comment = @commentable.comments.build comment_params
           if@comment.save
             flash[:success] = "Comment created!"  #Window Podtwerzdenija
             redirect_to  @commentable  #"perenaprowlenie" 
           else
              render 'new'
            end
          end
         
         def destroy # 2 Udalenie kaЖdogo commeta
            @comment = @commentable.comments.find params[:id]
            @comment.destroy
            flash[:success] = "Comment deleted!"     #Window Podtwerzdenija
            redirect_to  @commentable  #"perenaprowlenie" 
         end
         
         def show 
             @comment = @commentable.comments.find params[:id]
             @comment.destroy
             flash[:success] = "Comment deleted!"     #Window Podtwerzdenija
             redirect_to  @commentable
          end
         
          private
       
         def comment_params
           params.require(:comment).permit(:body)
         end
         
        def set_commentable
          if 
          params[:article_id].present?
          @commentable = Article.find_by_id(params[:article_id])
          else 
          params[:thing_id].present?
          @commentable = Thing.find_by_id(params[:thing_id])
        end
       end
     
          
     
end