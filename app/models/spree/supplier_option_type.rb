module Spree
  class SupplierOptionType < Spree::Base
    belongs_to :supplier
    belongs_to :option_type
  end
end
