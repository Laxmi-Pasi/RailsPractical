# Preview all emails at http://localhost:3000/rails/mailers/mail_users
class MailUsersPreview < ActionMailer::Preview
  
  def welcome_email
    MailUsersMailer.with(user: MailUser.last).welcome_email
  end

  def update_email
    MailUsersMailer.with(user: @user.id).update_email
  end
end
