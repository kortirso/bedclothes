class CategoriesController < ApplicationController
    before_action :find_categories

    def index
        @new_ones = Product.all.order(created_at: :desc).limit(8)
    end

    def show
        @category = Category.friendly.find(params[:id])
        @products = @category.products.order(created_at: :desc)
    end

    private

    def find_categories
        @categories = Category.where(main_category_id: nil).order(name: :asc)
    end
end
