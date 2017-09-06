class WelcomeController < ApplicationController
    def index
        @categories = Category.where(main_category_id: nil).order(name: :asc)
        @articles = Article.order(id: :desc).limit(3)
    end
end
