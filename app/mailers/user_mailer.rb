# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def welcome_mail(user)
    @user = user
    mail(to: AdminUser.pluck(:email), subject: 'new User Register to Online-Delivery System') if AdminUser.count.positive?
  end
end
