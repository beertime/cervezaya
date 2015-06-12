ActiveAdmin.register Product do

  permit_params :price, :published, :brand_id, :size_id, :bar_id, :franchise_id

  scope_to do
    Class.new do
      def self.products
        Product.unscoped
      end
    end
  end

end
