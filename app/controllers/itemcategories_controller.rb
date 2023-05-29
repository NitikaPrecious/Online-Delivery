class ItemcategoriesController < ApplicationController
  def index
  @itemcategories = Itemcategoy.all
  end
end
