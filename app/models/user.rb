# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :validatable
  
  after_validation :normalize_name, on: :create
  after_create :send_welcome_mail
  
  has_many :orders
  has_many :cart_items, dependent: :destroy
  validates :first_name,:last_name,:phone_number, presence: true
  validates :phone_number, numericality: { only_integer: true }
  validates :phone_number,length: {is: 10}
  def normalize_name
    self.first_name = first_name.titleize unless first_name.nil?
  end

  def send_welcome_mail
    UserMailer.welcome_mail(self).deliver_now
  end
end
