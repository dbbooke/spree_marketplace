module Spree
  class SupplierPrototype < Spree::Base
    belongs_to :supplier
    belongs_to :prototype
  end
end
