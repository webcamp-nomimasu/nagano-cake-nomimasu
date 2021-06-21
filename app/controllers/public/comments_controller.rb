class Public::CommentsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @item = Item.find(params[:item_id])
    @comment = Comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new
    comment = @item.comments.new(comment_params)
    comment.customer_id = current_customer.id
    comment.save
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
