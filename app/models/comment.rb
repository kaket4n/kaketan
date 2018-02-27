class Comment < ApplicationRecord
  validates :content, presence: true
  validate :login_required

  belongs_to :diary

  after_create_commit :notify_admin

  private

  def login_required
    errors.add(:user_id, "ログインが必要です") if user_id.nil?
  end

  def notify_admin
    NotificationMailer.notify_admin(self).deliver_later
  end
end
