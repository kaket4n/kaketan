class NotesController < ApplicationController
  before_action :set_note, only: :show
  before_action :set_title

  def index
    @notes = Note.order(id: :desc).page(params[:page]).per(10)
  end

  def show
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def set_title
    case action_name
    when "index"
      @title = "Notes"
    when "show"
      @title = @note&.title
    end
  end
end
