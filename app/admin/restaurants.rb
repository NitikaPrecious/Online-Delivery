# frozen_string_literal: true

ActiveAdmin.register Restaurant do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :description, :address, :phone_1, :phone_2, :minimum_order, :delivery_charge, :building_id
  #
  # or
  #
  permit_params do
    permitted = %i[name description address phone_1 phone_2 minimum_order delivery_charge]
    #  permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
