class HomeController < ApplicationController
    def index
        @q = Article.ransack(params[:q])
        @articles = @q.result(distinct: true)
    end
end
  