class Pick < ApplicationRecord
  before_create :assign_attr_with_scraping

  private

  def assign_attr_with_scraping
    page = Mechanize.new.get(url)

    self.title = page.title
    self.description = page.at('meta[@property="og:description"]')["content"]
    self.img_url = page.at('meta[@property="og:image"]')["content"]
  end
end
