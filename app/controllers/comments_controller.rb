class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to diary_path(@comment.diary)
    else
      @diary = Diary.find(params[:comment][:diary_id])
      @comments = Comment.where(diary_id: params[:comment][:diary_id])
      render "diaries/show"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:diary_id, :user_id, :content)
  end
end
