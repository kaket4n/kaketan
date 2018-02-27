class DiariesController < ApplicationController
  before_action :set_diary, only: :show
  before_action :set_title
  before_action :set_diary_meta_tags, only: :show

  def index
    @diaries = Diary.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @comments = Comment.where(diary_id: params[:id])
    @comment = Comment.new
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def set_title
    case action_name
    when "index"
      @title = "Diaries"
    when "show"
      @title = @diary&.title
    end
  end

  def set_diary_meta_tags
    description = view_context.strip_tags(view_context.markdown(@diary.content)[0..120])
    set_meta_tags description: description,
                  og: { description: description },
                  twitter: { description: description }
  end
end
