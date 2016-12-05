class AddApprovalToSupplier < ActiveRecord::Migration
  def change
	add_column :spree_suppliers, :approved, :boolean, default: false
  end
end
