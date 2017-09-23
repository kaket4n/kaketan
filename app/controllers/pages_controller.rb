class PagesController < ApplicationController
  def terms
    @title = "利用規約"
  end

  def privacy
    @title = "プライバシーポリシー"
  end
end
