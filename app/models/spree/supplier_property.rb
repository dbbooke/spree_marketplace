module Spree
  class SupplierProperty < Spree::Base
    belongs_to :supplier
    belongs_to :property
  end
end
