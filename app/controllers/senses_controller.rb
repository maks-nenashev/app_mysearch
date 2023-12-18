class SensesController < ApplicationController
    before_action :set_sense!, only: %i[show destroy edit update]  # @article = Article.find params[:id]   "Refactoring"
                                                               
    def index   # 4: Wywod wsech zapisej!
        #@senses = Sense.all
        @locals = Local.all
        @q = Sense.ransack(params[:q])
        @pagy,@senses = pagy @q.result(distinct: true),page: params[:page], items:9
     end
     
    def show  # 3: Wywodim bazu po :ID
        @commentable = @sense
        @comment = Comment.new
        @locals = Local.new
        # @sense = Sense.find params[:id]    :before_action :set_article! "Refactoring"
     end
       
   
    def new  # 1: создать - new (отобразить форму. GET)
        @sense = Sense.new  # Пустым оставлять тельзя!
        @locals = Local.all
       end
     
    def create # 2: create (отправить форму. POST)   
        @sense = Sense.new(sense_params)
        #@locals = Local.new
        #@article = current_user.Article.new(article_params)
     if @sense.valid?
        @sense.save 
        flash[:success] = "Article created!"   #Window Podtwerzdenija
        redirect_to @sense #У нас происходит редирект на "show" поэтому представление --
                             #--"create" нам теперь не нужно, его можно удалить.
     else
        render action: 'new'  #"perenaprowlenie"
      end
    end
     
    def edit   # 5: Wozwrat i Redactirowanie
       #@sense = Sense.find params[:id] :before_action :set_sense! "Refactoring"
    end
   
    def update #6  Wnosim izmenrnie w redaktirowanie
       #@sense = Sense.find(params[:id]) :before_action :set_sense! "Refactoring"
       if @sense.update(sense_params) # Obnowlaem s nowymi parametromi
        redirect_to @sense
        flash[:success] = "Article updated!" #Window Podtwerzdenija
       else
        render action: 'edit'    #"perenaprowlenie"
     end
   end
   
   def destroy # Delite publikacij
     #@sense = Sense.find(params[:id]) # :before_action :set_sense! "Refactoring"
     @sense.destroy
     flash[:success] = "Article deleted!"     #Window Podtwerzdenija
     redirect_to @sense  #"perenaprowlenie"
   end
   
   #////////////////////////////////////////////////////////////////////////////////////
    private
   
     def sense_params
       params.require(:sense).permit(:title, :text, :local_id, :image)
    end
   
     def set_sense!  # :before_action :set_sense! only[show destroy edit update] "Refactoring"
       @sense = Sense.find(params[:id])
    end
   
   
end
