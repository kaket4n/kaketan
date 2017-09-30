class Note < ApplicationRecord
  belongs_to :category

  default_scope { order(id: :desc) }

  def public?
    restriction == 0
  end
end
