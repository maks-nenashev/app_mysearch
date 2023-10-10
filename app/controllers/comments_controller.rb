class CommentsController < ApplicationController
  before_action :set_commentable!
  before_action :set_article!
        
                                     #Krome "create"
        def update  # 5 Wnosim izmenrnie w redaktirowanie
               @comment = @commentable.comments.find params[:id]
              #@comment = @article.comments.find params[:id]--:set_comment!  # 2:set_commint! "Refactoring"
             if@comment.update(comment_params) # Obnowlaem s nowymi parametromi
               redirect_to article_path(@article)   #"perenaprowlenie" 
               flash[:success] = "Comment updated!" #Window Podtwerzdenija
              else
               render action: 'edit'    #"perenaprowlenie"
            end
           end
        
         def edit  # 4 Wozwrat i Redactirowanie
             #@comment = @article.comments.find params[:id]--:set_comment!  # 2:set_commint! "Refactoring"
             @comment = @commentable.comments.find params[:id]
            end
        
          
       def new  # 3 создать - new (отобразить форму. GET)
           @article = Article.new  # Пустым оставлять тельзя!
        end
        
       def create# 1: create (отправить форму. POST)  
             #@comment = @article.comments.build(comment_params)  #Comment привязывам к Article
             @comment = @commentable.comments.build comment_params
           if@comment.save
             flash[:success] = "Comment created!"  #Window Podtwerzdenija
             redirect_to article_path(@article)   #"perenaprowlenie" 
           else
             #@comments = @article.comments.order created_at: :desc
             render 'articles/show'            #"perenaprowlenie"      
           end
        end
         
         def destroy # 2 Udalenie kaЖdogo commeta
            @comment = @commentable.comments.find params[:id]
          #@comment = @article.comments.find params[:id]--:set_comment!  # 2:set_commint! "Refactoring"
            @comment.destroy
            flash[:success] = "Comment deleted!"     #Window Podtwerzdenija
            redirect_to article_path(@article)   #"perenaprowlenie" 
         end
         
         def show # Kontroller zaprosil "SHOW" dla udalenija
             @comment = @commentable.comments.find params[:id]
          #@article = Article.find(params[:article_id])
             #@comment = @article.comments.find(params[:id])
             @comment.destroy
             flash[:success] = "Comment deleted!"     #Window Podtwerzdenija
             redirect_to article_path(@article)
          end
         
          private
       
         def comment_params
           params.require(:comment).permit(:body)
         end
         
        def set_commentable!
          klass = [Article, Comment].detect { |c| params["#{c.name.underscore}_id"] }
          raise ActiveRecord::RecordNotFound if klass.blank?
      
          @commentable = klass.find(params["#{klass.name.underscore}_id"])
        end
         
     
         def set_article!
          @article = @commentable.is_a?(Article) ? @commentable : @commentable.article
        end
     
     
     #def destroy
       #  comment = @article.comments.find params[:id]
        # comment.destroy
        # flash[:success] = "Answer deleted!"     #Window Podtwerzdenija
        # redirect_to article_path(@article)   #"perenaprowlenie" 
       #end
          
     
end