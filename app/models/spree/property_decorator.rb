module Spree
  Property.class_eval do

    has_many :suppliers, through: :supplier_properties
    has_many :supplier_properties

  end
end
