# frozen_string_literal: true

ActiveAdmin.register User do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :email, :first_name, :last_name, :password, :password_confirmation,:phone_number
  #
  # or
  #
  #permit_params do
  #   permitted = %i[email encrypted_password reset_password_token reset_password_sent_at password first_name last_name
  #                  address phone_number]
  #   # permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone_number
      f.input :password
      f.input :password_confirmation

    end
    f.actions
  end
end
