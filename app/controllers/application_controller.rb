class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags

  private

  def prepare_meta_tags
    set_meta_tags description: "いま最も注目すべき KAKETAN の発信する情報メディア",
                  image_src: "#{ActionController::Base.helpers.asset_path "qkake"}"
  end
end
