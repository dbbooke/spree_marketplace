class AddAgreementsToSupplier < ActiveRecord::Migration
  def change
	add_column :spree_suppliers, :agree_tos, :boolean, default: false
	add_column :spree_suppliers, :agree_not_dropshiped, :boolean, default: false
	add_column :spree_suppliers, :agree_tos_violate, :boolean, default: false
  end
end
