class MailUser < ApplicationRecord
  mount_uploader :picture, PictureUploader
end
