# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable
  
  before_validation :normalize_name, on: :create
  after_create :send_welcome_mail, :create_cart
  
  has_many :orders
  has_one :cart

  validates :phone_number, numericality: { only_integer: true }

  def normalize_name
    self.first_name = first_name.downcase.titleize
  end

  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
  end

  def create_cart
    Cart.create(user_id: id)
  end
end
