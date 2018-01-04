class Diary < ApplicationRecord
  belongs_to :category
  before_create :set_default_title, if: lambda { |diary| diary.title.blank? }

  def public?
    restriction == 0
  end

  private

  def set_default_title
    self.title = Date.today.strftime("%Y年%m月%d日")
  end
end
