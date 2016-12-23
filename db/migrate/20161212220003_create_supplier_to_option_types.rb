class CreateSupplierToOptionTypes < ActiveRecord::Migration
  def change
    create_table :spree_supplier_option_types do |t|
      t.belongs_to :supplier, index: true
      t.belongs_to :option_type, index: true
      t.timestamps
    end

  end
end
