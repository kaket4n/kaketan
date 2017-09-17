class AdminController < ApplicationController
  before_action :redirect_to_root, unless: -> { admin? }

  def index
  end

  private

  def redirect_to_root
    redirect_to root_path
  end
end
