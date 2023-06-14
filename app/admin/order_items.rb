ActiveAdmin.register OrderItem do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :quantity, :sub_total, :order_id, :item_id
   config.clear_action_items!


  # or
  #
  # permit_params do
  #   permitted = [:quantity, :sub_total, :order_id, :cart_item_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs do
      f.input :order,collection: Order.all.map { |t| [t.id]}
      f.input :item, collection: Item.all.map { |t| [t.id]}
      f.input :quantity
      f.input :sub_total
    
    end
    f.actions
  end
  
end
