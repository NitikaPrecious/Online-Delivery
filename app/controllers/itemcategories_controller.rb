# frozen_string_literal: true

class ItemcategoriesController < ApplicationController
  def index
    @itemcategories = Itemcategoy.all
  end
end
