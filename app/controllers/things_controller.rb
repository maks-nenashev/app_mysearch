class ThingsController < ApplicationController
    before_action :set_thing!, only: %i[show destroy edit update]  # @article = Article.find params[:id]   "Refactoring"
                                                               
    def index   # 4: Wywod wsech zapisej!
        @things = Thing.all
        @locals = Local.all
      end
     
    def show  # 3: Wywodim bazu po :ID
        @commentable = @thing
        @comment = Comment.new
        @locals = Local.new
        # @thing = Thing.find(params[:id]) :before_action :set_thing! only[show destroy edit update] "Refactoring"
     end
       
   
    def new  # 1: создать - new (отобразить форму. GET)
        @thing = Thing.new  # Пустым оставлять тельзя!
        @locals = Local.all
       end
     
    def create # 2: create (отправить форму. POST)   
        @thing = Thing.new(thing_params)
       # @locals = Local.new
        #@article = current_user.Article.new(article_params)
     if @thing.valid?
        @thing.save 
        flash[:success] = "Article created!"   #Window Podtwerzdenija
        redirect_to @thing #У нас происходит редирект на "show" поэтому представление --
                             #--"create" нам теперь не нужно, его можно удалить.
     else
        render action: 'new'  #"perenaprowlenie"
      end
    end
     
    def edit   # 5: Wozwrat i Redactirowanie
       #@thing = Thing.find params[:id] :before_action :set_thing! "Refactoring"
    end
   
    def update #6  Wnosim izmenrnie w redaktirowanie
       #@thing = Thing.find(params[:id]) before_action :set_shing! "Refactoring"
     if @thing.update(thing_params) # Obnowlaem s nowymi parametromi
        redirect_to @thing
        flash[:success] = "Article updated!" #Window Podtwerzdenija
       else
        render action: 'edit'    #"perenaprowlenie"
     end
   end
   
   def destroy # Delite publikacij
     #@thing = Thing.find(params[:id]) # :before_action :set_thing! "Refactoring"
     @thing.destroy
     flash[:success] = "Article deleted!"     #Window Podtwerzdenija
     redirect_to @thing  #"perenaprowlenie"
   end
   
   #////////////////////////////////////////////////////////////////////////////////////
    private
   
     def thing_params
       params.require(:thing).permit(:title, :text, :local_id,)
    end
   
     def set_thing!  # :before_action :set_thing! only[show destroy edit update] "Refactoring"
       @thing = Thing.find(params[:id])
    end
   
   
end
