class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.new(comment_params)
    if @comment.save
      redirect_to topics_path, success: 'コメントを投稿しました'
    else
      redirect_to topics_path, danger: 'コメントに失敗しました'
    end
  end
  
  def destroy
    @comment = Comment.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    @comment.destroy
    redirect_to topics_path, success: 'コメントを削除しました'
  end
  
  private
  def comment_params
    params.require(:comment).permit(:comment ,:topic_id)
  end

end