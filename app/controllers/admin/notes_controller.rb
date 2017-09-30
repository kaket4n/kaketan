class Admin::NotesController < AdminController
  before_action :set_note, only: [:show, :edit, :update]

  def index
    @notes = Note.all
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      redirect_to admin_note_path(@note)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to admin_note_path(@note)
    else
      render :edit
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:category_id, :restriction, :title, :content)
  end
end
