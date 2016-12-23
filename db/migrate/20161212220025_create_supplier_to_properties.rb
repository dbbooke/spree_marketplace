class CreateSupplierToProperties < ActiveRecord::Migration
  def change
 	create_table :spree_supplier_properties do |t|
      t.belongs_to :supplier, index: true
      t.belongs_to :property, index: true
      t.timestamps
    end

  end
end
