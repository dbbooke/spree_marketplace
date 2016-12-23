module Spree
  OptionType.class_eval do

    has_many :suppliers, through: :supplier_option_types
    has_many :supplier_option_types

  end
end
