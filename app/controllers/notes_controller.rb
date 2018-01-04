class NotesController < ApplicationController
  before_action :set_note, only: :show
  before_action :set_title
  before_action :set_note_meta_tags, only: :show

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

  def set_note_meta_tags
    description = view_context.strip_tags(view_context.markdown(@note.content)[0..120])
    set_meta_tags description: description,
                  og: { description: description },
                  twitter: { description: description }
  end
end
