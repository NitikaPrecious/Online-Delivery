# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable
  
  after_validation :normalize_name, on: :create
  after_create :send_welcome_mail, :create_cart


  
  has_many :orders
  has_one :cart
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :phone_number,length: {is: 10}
  def normalize_name
    self.first_name = first_name.titleize unless first_name.nil?
  end

  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
  end

  def create_cart
    Cart.create(user_id: id)
  end
end
