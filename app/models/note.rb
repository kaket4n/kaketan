class Note < ApplicationRecord
  belongs_to :category

  def public?
    restriction == 0
  end
end
