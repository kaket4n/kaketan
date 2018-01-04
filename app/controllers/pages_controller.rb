class PagesController < ApplicationController
  def terms
    @title = "利用規約"
  end

  def privacy
    @title = "プライバシーポリシー"
  end

  def spirit
    @title = "超充スピリット宣言"
  end

  def career
    set_meta_tags nofollow: true, noindex: true
    @title = "キャリア"
  end
end
