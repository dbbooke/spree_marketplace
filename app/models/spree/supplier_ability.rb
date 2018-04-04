module Spree
  class SupplierAbility
    include CanCan::Ability

    def initialize(user)
      user ||= Spree.user_class.new
        can [:manage, :edit,:update,:subscribe]

      if user.supplier and user.supplier.approved == true


        can [:admin,:manage], Spree::Supplier, id: user.supplier_id
        cannot [:index], Spree::Supplier

        # can [:create], Spree::AdmissionReview
        # can [:admin, :manage], Spree::AdmissionReview, supplier: { supplier_id: user.supplier_id }

        can [:admin, :manage, :stock], Spree::Product do |product|
          product.supplier_ids.include?(user.supplier_id)
        end

        can [:admin, :create, :index], Spree::Product

        can [:create], Spree::Prototype
        can [:admin, :manage], Spree::Prototype#, id: user.supplier.prototypes.pluck(:id)

        # can [:admin, :manage,:index], Spree::Taxon
        # can [:admin, :manage,:index], Spree::Taxonomy

        # Action for listing?
        can [:create], Spree::Property
        can [:admin, :index], Spree::Property, id: user.supplier.properties.pluck(:id)

        can [:create], Spree::OptionType
        can [:admin, :manage], Spree::OptionType, id: user.supplier.option_types.pluck(:id)


        # cannot [:admin,:manage, :index, :campaign, :list], Spree::Marketing


        can [:admin, :index, :read], Spree::ShippingCategory

        can [:admin, :manage, :read, :ready, :ship], Spree::Shipment, order: { state: 'complete' }, stock_location: { supplier_id: user.supplier_id }


        can [:admin, :create, :update], :stock_items
        can [:admin, :manage], Spree::StockItem, stock_location_id: user.supplier.stock_locations.pluck(:id)
        can [:admin, :manage], Spree::StockLocation, supplier_id: user.supplier_id
        can :create, Spree::StockLocation
        can [:admin, :manage], Spree::StockMovement, stock_item: { stock_location_id: user.supplier.stock_locations.pluck(:id) }
        can :create, Spree::StockMovement



        # TODO: Want this to be inline like:
        # can [:admin, :manage], Spree::Variant, supplier_ids: user.supplier_id
        can [:admin, :create, :index], Spree::Variant

        can [:admin, :manage], Spree::Variant do |variant|
          variant.supplier_ids.include?(user.supplier_id)
        end


        if SpreeMarketplace::Engine.spree_digital_available?
          # can [:admin, :manage], Spree::Digital, variant: { supplier_ids: user.supplier_id }
          can [:admin, :manage], Spree::Digital do |digital|
            digital.variant.supplier_ids.include?(user.supplier_id)
          end
          can :create, Spree::Digital
        end
        can [:admin, :manage], Spree::Image do |image|
          image.viewable.product.supplier_ids.include?(user.supplier_id)
        end
        can :create, Spree::Image
        if SpreeMarketplace::Engine.spree_group_price_available?
          # can [:admin, :manage], Spree::GroupPrice, variant: { supplier_ids: user.supplier_id }
          can [:admin, :manage], Spree::GroupPrice do |price|
            price.variant.supplier_ids.include?(user.supplier_id)
          end
        end
        if SpreeMarketplace::Engine.spree_related_products_available?
          # can [:admin, :manage], Spree::Relation, relatable: { supplier_ids: user.supplier_id }
          can [:admin, :manage], Spree::Relation do |relation|
            relation.relatable.supplier_ids.include?(user.supplier_id)
          end
        end

      end

      if SpreeMarketplace::Config[:allow_signup]
        can :create, Spree::Supplier
      end

      if SpreeMarketplace::Engine.ckeditor_available?
        can :access, :ckeditor

        can :create, Ckeditor::AttachmentFile
        can [:read, :index, :destroy], Ckeditor::AttachmentFile, supplier_id: user.supplier_id

        can :create, Ckeditor::Picture
        can [:read, :index, :destroy], Ckeditor::Picture, supplier_id: user.supplier_id
      end



    end
  end
end
