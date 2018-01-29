class Image < ApplicationRecord
  #添付ファイルアップロードに関する設定
  has_attached_file :image, styles: {
    :thumb  => "100x100>",
    :medium => "200x200#",
    :large  => "640x320>"
  }

  #画像ファイルに関するバリデーション
  validates_attachment_content_type :image, 
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
