class NotificationMailer < ApplicationMailer
  def notify_admin(comment)
    @comment = comment
    @diary = comment.diary

    unless @diary.nil?
      mail(to: "kaketancom@gmail.com", subject: "日記にコメントが書かれました。")
    end
  end
end
