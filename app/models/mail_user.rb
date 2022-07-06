class MailUser < ApplicationRecord
  validates :name,:email,:picture, presence: true
  mount_uploader :picture, PictureUploader
  after_destroy :remove_id_directory

  def remove_id_directory
    #FileUtils.remove_dir("/home/laxmipasi/Documents/projects/RailsPractical/public/uploads/mail_user/picture/#{@id}")
  end
end
