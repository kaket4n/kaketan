class Comment < ApplicationRecord
  validates :content, presence: true
  validate :login_required

  belongs_to :diary

  private

  def login_required
    errors.add(:user_id, "ログインが必要です") if user_id.nil?
  end
end
