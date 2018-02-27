class NotificationMailer < ApplicationMailer
  def notify_admin(comment)
    @comment = comment
    @diary = comment.diary

    unless @diary.nil?
      mail(to: "kaketancom@gmail.com", subject: "日記にコメントが書かれました。")
    end
  end

  def notify_users(current_comment)
    @comment = current_comment
    @diary = current_comment&.diary

    return if @diary.nil?

    target_user_ids = @diary.comments.includes(:user).map(&:user).pluck(:id).uniq
    target_user_ids.delete(current_comment.user.id)

    User.where(id: target_user_ids).each do |user|
      mail(to: user.email, subject: "あなたがコメントした日記にコメントが書かれました。")
    end
  end
end
