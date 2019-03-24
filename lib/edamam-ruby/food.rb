module Edamam
  module Response
    class Food
      attr_reader :food_id, :label, :nutrients, :measure, :brand, :category, :category_label

      def initialize(food_attr)
        food_attr.each do |attr_name, value|
          instance_variable_set("@#{attr_name.snakecase}", value)
        end
      end
    end
  end
end
