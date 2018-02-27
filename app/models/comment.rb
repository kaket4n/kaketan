class Comment < ApplicationRecord
  validates :content, presence: true
  validate :login_required

  belongs_to :diary
  belongs_to :user

  after_create_commit :notify_users

  private

  def login_required
    errors.add(:user_id, "ログインが必要です") if user_id.nil?
  end

  def notify_users
    NotificationMailer.notify_admin(self).deliver_later
    NotificationMailer.notify_users(self).deliver_later
  end
end
