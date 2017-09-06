require 'csv'

class ProductLoaderService
    attr_reader :file_name

    def initialize
        @file_name = "#{Rails.root}/db/data.csv"
    end

    def load
        CSV.read(file_name, encoding: 'utf-8', col_sep: ';')[1..-1].each do |row|
            category_main = Category.find_or_create_by name: row[9]
            category_sub = Category.find_or_create_by name: row[10], main_category_id: category_main.id

            Product.find_or_create_by name: row[1], category_id: category_sub.id do |product|
                product.price = row[4]
                product.product_link = row[6]
                product.pack_link = row[7]
            end
        end
    end
end