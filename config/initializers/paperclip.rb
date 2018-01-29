Paperclip::Attachment.default_options[:url] = ":s3_domain_url"
Paperclip::Attachment.default_options[:path] = '/:style/:filename'
Paperclip.options[:image_magick_path] = "/usr/local/bin/magick"
Paperclip.options[:command_path] = "/usr/local/bin/"
