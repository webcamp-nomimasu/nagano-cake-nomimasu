class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.new(commnet_params)
    @item = @comment.item
    if @comment.save
      respond_to :js
    else
      flash[:alert] = "コメントに失敗しました"
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @item = @comment.item
    if @comment.destory
      respond_to :js
    else
      flash[:alert] = "コメントの削除に失敗しました"
    end
  end
  
  def index
  end
  
  private
  
  def comment_params
    params.require(:comment).permit(:customer_id, :item_id, :comment)
  end
end
