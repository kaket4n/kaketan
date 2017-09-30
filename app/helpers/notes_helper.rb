module NotesHelper
  def twitter_share_button(url:nil, text:nil)
    "<a href='https://twitter.com/share' class='twitter-share-button' data-url='#{url}' data-text='#{text&.truncate(70)}' data-hashtags='KAKETANCOM'>Tweet</a> <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>".html_safe
  end

  def hatena_share_button(url:nil)
    "<a href='#{url}' class='hatena-bookmark-button' data-hatena-bookmark-layout='basic-label-counter' data-hatena-bookmark-lang='ja' title='このエントリーをはてなブックマークに追加'><img src='https://b.st-hatena.com/images/entry-button/button-only@2x.png' alt='このエントリーをはてなブックマークに追加' width='20' height='20' style='border: none;' /></a><script type='text/javascript' src='https://b.st-hatena.com/js/bookmark_button.js' charset='utf-8' async='async'></script>".html_safe
  end

  def restrictable(note)
    if user_signed_in?
      note
    else
      note.gsub(/<secret>(\R|.)*<\/secret>/, invitation_text)
    end
  end

  private

  def invitation_text
    <<-EOS
      <p class="h4">ここから先はチャンネル登録者のみ閲覧可能です。</p><div class="text-center"><a href="/users/sign_up"><span class="button">無料でチャンネル登録する</span></a></div>
    EOS
  end
end
