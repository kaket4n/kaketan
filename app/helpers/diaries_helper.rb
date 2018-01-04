module DiariesHelper
  def markdown(text)
    unless @markdown
      renderer = Redcarpet::Render::HTML.new
      @markdown = Redcarpet::Markdown.new(renderer)
    end

    @markdown.render(text)
  end

  def restrictable(diary)
    if user_signed_in?
      diary
    else
      diary.gsub(/<secret>(\R|.)*<\/secret>/, invitation_text)
    end
  end

  private

  def invitation_text
    <<-EOS
      <p class="h4">ここから先はチャンネル登録者のみ閲覧可能です。</p><div class="text-center"><a href="/users/sign_up"><span class="button">無料でチャンネル登録する</span></a></div>
    EOS
  end
end
