class CommentsController < ApplicationController
  def create

    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
        respond_to do |format|
          format.html { redirect_back(fallback_location: root_path)  }
          format.json
        end
      else
        render action: :show
      end
   end

  private
  def comment_params
    
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
   
  end
  
end
