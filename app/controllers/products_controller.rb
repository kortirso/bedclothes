class ProductsController < ApplicationController
    before_action :find_categories

    def show
        @product = Product.friendly.find(params[:id])
    end
end
