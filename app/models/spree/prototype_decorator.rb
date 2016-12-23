module Spree
  Prototype.class_eval do

    has_many :suppliers, through: :supplier_prototypes
    has_many :supplier_prototypes

  end
end
