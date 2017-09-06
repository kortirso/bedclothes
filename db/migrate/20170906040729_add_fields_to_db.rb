class AddFieldsToDb < ActiveRecord::Migration[5.1]
    def change
        add_column :categories, :main_category_id, :integer
        add_column :products, :product_link, :string
        add_column :products, :pack_link, :string
    end
end
