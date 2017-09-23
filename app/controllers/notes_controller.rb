class NotesController < ApplicationController
  before_action :set_note, only: :show
  before_action :set_title

  def index
    @notes = Note.all
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
      @title = "Notes｜KAKETAN.COM"
    when "show"
      @title = "#{@note&.title}｜KAKETAN.COM"
    end
  end
end
