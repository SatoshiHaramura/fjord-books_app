# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: :destroy

  def create
    comment = @commentable.comments.new(comment_params.merge(user: current_user))
    if comment.save!
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to @commentable
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_commentable
    @commentable =
      if params[:book_id].present?
        Book.find(params[:book_id])
      elsif params[:report_id].present?
        Report.find(params[:report_id])
      end
  end

  def set_comment
    @comment = @commentable.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
