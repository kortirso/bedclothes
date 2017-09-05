module Api
    module V1
        class BaseController < ApplicationController
            skip_before_action :set_products_cart
        end
    end
end
