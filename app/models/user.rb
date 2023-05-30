# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable
  has_many :orders
  has_many :cartItem
  validates :phone_number, numericality: { only_integer: true }

  before_validation :normalize_name, on: :create
  def normalize_name
    self.first_name = first_name.downcase.titleize
  end

  after_create :send_welcome_mail, :create_cart

  def send_welcome_mail
    # send welcome mail to user and admin
    UserMailer.welcome_mail(self).deliver_now
  end

  def create_cart
    Cart.create(user_id: id)
  end
end
