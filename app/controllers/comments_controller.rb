class CommentsController < ApplicationController
  before_action :set_commentable!
  before_action :set_question
  
  def create
    @comment = @commentable.comments.build comment_params

    if @comment.save
      flash[:success] = t".success" # Window Podtwerzdenija
      redirect_to article_path(@article)
    else
      #@comment = @tweet.decorate
      #load_articles_comments do_render: true
    end
  end
 
  def destroy
    comment = @commentable.comments.find params[:id]
    tweet.destroy
    flash[:success] = 'success'
    redirect_to article_path(@article)
  end
  
  private

  def comment_params
    params.require(:comment).permit(:body)#.merge(user: current_user)
  end

  def set_commentable!
    klass = [Article].detect { |c| params["#{c.name.underscore}_id"] }
    raise ActiveRecord::RecordNotFound if klass.blank?

    @commentable = klass.find(params["#{klass.name.underscore}_id"])
  end

  def set_question
    @article = @commentable.is_a?(Article) ? @commentable : @commentable.article
  end
end