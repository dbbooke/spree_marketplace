class CreateSpreeSupplierPrototypes < ActiveRecord::Migration
  def change
    create_table :spree_supplier_prototypes do |t|
      t.belongs_to :supplier, index: true
      t.belongs_to :prototype, index: true
      t.timestamps
    end
  end
end
