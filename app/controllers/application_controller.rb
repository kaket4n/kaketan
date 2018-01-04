class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :prepare_meta_tags

  private

  def prepare_meta_tags
    set_meta_tags description: "いま最も注目すべき KAKETAN の発信する情報メディア",
                  og: {
                    site_name: "KAKETAN.COM",
                    description: "いま最も注目すべき KAKETAN の発信する情報メディア",
                    image: "#{view_context.asset_path "qkake"}"
                  },
                  twitter: { card: "summary" }
  end
end
