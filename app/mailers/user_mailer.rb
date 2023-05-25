class UserMailer < ApplicationMailer
    def welcome_mail(user)
        @user = user
        mail(to: AdminUser.pluck(:email),subject: "new User Register to Online-Delivery System")
    end
end
