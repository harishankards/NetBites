class CommentsController < ApplicationController
def create
    @post = Recipe.find(params[:recipe_id])
    @comment = @post.comments.create(params[:comment].permit(:content))
    @comment.commenter= current_user.name
    @comment.user = current_user
    respond_to do |format|
      if @comment.save
        format.html { redirect_to root_path }
      end
    end
  end
  
def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
    end
  end
end
