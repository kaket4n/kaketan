class Admin::DiariesController < AdminController
  before_action :set_diary, only: [:show, :edit, :update]

  def index
    @diaries = Diary.order(id: :desc).page(params[:page]).per(10)
  end

  def show
    @comments = Comment.where(diary_id: params[:diary_id])
  end

  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)

    if @diary.save
      redirect_to admin_diary_path(@diary)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @diary.update(diary_params)
      redirect_to admin_diary_path(@diary)
    else
      render :edit
    end
  end

  private

  def set_diary
    @diary = Diary.find(params[:id])
  end

  def diary_params
    params.require(:diary).permit(:category_id, :restriction, :title, :content)
  end
end
