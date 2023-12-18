class ArticlesController < ApplicationController
   
   before_action :set_article!, only: %i[show destroy edit update]  # @article = Article.find params[:id]   "Refactoring"
                                                               
    
    def index   # 4: Wywod wsech zapisej!
       #@articles = Article.all
       @locals = Local.all
       @q = Article.ransack(params[:q])
       @pagy,@articles = pagy @q.result(distinct: true),page: params[:page], items:9
      end
    
   def show  # 3: Wywodim bazu po :ID
      @commentable = @article
      @comment = Comment.new
      # @article = Article.find params[:id]  :before_action :set_article! "Refactoring"
      @locals = Local.new
   end
      
  
   def new  # 1: создать - new (отобразить форму. GET)
       @article = Article.new  # Пустым оставлять тельзя!
       @locals = Local.all
      end
    
   def create # 2: create (отправить форму. POST)   
       @article = Article.new(article_params)
       #@article = current_user.Article.new(article_params)     
    if @article.valid?
       @article.save 
       flash[:success] = "Article created!"   #Window Podtwerzdenija
       redirect_to @article 
    else
       @locals = Local.all
    #else  
      render action: 'new'  #"perenaprowlenie"
     end
   end
    
   def edit   # 5: Wozwrat i Redactirowanie
      #@article = Article.find params[:id]    :before_action :set_question! "Refactoring"
   end
  
   def update #6  Wnosim izmenrnie w redaktirowanie
      #@article = Article.find(params[:id])      :before_action :set_article! "Refactoring"
    if @article.update(article_params) # Obnowlaem s nowymi parametromi
       redirect_to @article
       flash[:success] = "Article updated!" #Window Podtwerzdenija
      else
       render action: 'edit'    #"perenaprowlenie"
    end
  end
  
  def destroy # Delite publikacij
    #@article = Article.find(params[:id]) #:before_action :set_article! "Refactoring"
    @article.destroy
    flash[:success] = "Article deleted!"     #Window Podtwerzdenija
    redirect_to @article  #"perenaprowlenie"
  end
  
  #////////////////////////////////////////////////////////////////////////////////////
   private
  
    def article_params
      params.require(:article).permit(:title, :text, :local_id, :image)
   end
  
    def set_article!  # :before_action :set_article! only[show destroy edit update] "Refactoring"
      @article = Article.find(params[:id])
   end
  
  
  end
  