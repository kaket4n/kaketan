class Pick < ApplicationRecord
  before_validation :assign_attr_with_scraping
  validate :img_url_must_be_present

  private

  def assign_attr_with_scraping
    page = Mechanize.new.get(url)

    self.title = page.title
    self.description = page.at('meta[@property="og:description"]')["content"]
    self.img_url = page.at('meta[@property="og:image"]')["content"]
  rescue => e
  end

  def img_url_must_be_present
    if img_url.blank?
      errors.add(:img_url, "img_url の取得に失敗しました。")
    end
  end
end
