class MailUsersMailer < ApplicationMailer
  default from: 'pasilaxmidevi@gmail.com'
  def welcome_email
    @user = params[:user]
    @url  = 'http://example.com/login'
    attachments.inline['filename.jpg'] = File.read("/home/laxmipasi/Documents/projects/RailsPractical/public/#{@user.picture.url}")
    mail(to: @user.email, subject: 'Welcome to My Awesome Site') do |format|
      format.text
      format.html { render layout: 'email_layout' }
    end
  end   

  def update_email
    @user = params[:user]
    mail(to: @user.email, subject: 'Update Email') do |format|
      format.html { render layout: 'update_email' }
    end
  end
end
