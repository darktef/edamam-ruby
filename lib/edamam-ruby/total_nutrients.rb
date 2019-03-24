module Edamam
  module Response
    class TotalNutrients
      NUTRIENT_REFERENCE = [
        {
          code: "CA",
          name: "Calcium",
          method_name: "calcium",
          unit: "mg"
        },
        {
          code: "ENERC_KCAL",
          name: "Energy",
          method_name: "energy",
          unit: "kcal"
        },
        {
          code: "CHOCDF",
          name: "Carbs",
          method_name: "carbs",
          unit: "g"
        },
        {
          code: "NIA",
          name: "Niacin (B3)",
          method_name: "niacin_b3",
          unit: "mg"
        },
        {
          code: "CHOLE",
          name: "Cholesterol",
          method_name: "cholesterol",
          unit: "mg"
        },
        {
          code: "P",
          name: "Phosphorus",
          method_name: "phosphorus",
          unit: "mg"
        },
        {
          code: "FAMS",
          name: "Monounsaturated",
          method_name: "monounsaturated",
          unit: "g"
        },
        {
          code: "PROCNT",
          name: "Protein",
          method_name: "protein",
          unit: "g"
        },
        {
          code: "FAPU",
          name: "Polyunsaturated",
          method_name: "polyunsaturated",
          unit: "g"
        },
        {
          code: "RIBF",
          name: "Riboflavin (B2)",
          method_name: "riboflavin_b2",
          unit: "mg"
        },
        {
          code: "FASAT",
          name: "Saturated",
          method_name: "saturated",
          unit: "g"
        },
        {
          code: "SUGAR",
          name: "Sugars",
          method_name: "sugars",
          unit: "g"
        },
        {
          code: "FAT",
          name: "Fat",
          method_name: "fat",
          unit: "g"
        },
        {
          code: "THIA",
          name: "Thiamin (B1)",
          method_name: "thiamin_b1",
          unit: "mg"
        },
        {
          code: "FATRN",
          name: "Trans",
          method_name: "trans",
          unit: "g"
        },
        {
          code: "TOCPHA",
          name: "Vitamin E",
          method_name: "vitamin_e",
          unit: "mg"
        },
        {
          code: "FE",
          name: "Iron",
          method_name: "iron",
          unit: "mg"
        },
        {
          code: "VITA_RAE",
          name: "Vitamin A",
          method_name: "vitamin_a",
          unit: "g"
        },
        {
          code: "FIBTG",
          name: "Fiber",
          method_name: "fiber",
          unit: "g"
        },
        {
          code: "VITB12",
          name: "Vitamin B12",
          method_name: "vitamin_b12",
          unit: "g"
        },
        {
          code: "FOLDFE",
          name: "Folate (Equivalent)",
          method_name: "folate_equivalent",
          unit: "g"
        },
        {
          code: "VITB6A",
          name: "Vitamin B6",
          method_name: "vitamin_b6",
          unit: "mg"
        },
        {
          code: "K",
          name: "Potassium",
          method_name: "potassium",
          unit: "mg"
        },
        {
          code: "VITC",
          name: "Vitamin C",
          method_name: "vitamin_c",
          unit: "mg"
        },
        {
          code: "MG",
          name: "Magnesium",
          method_name: "magnesium",
          unit: "mg"
        },
        {
          code: "VITD",
          name: "Vitamin D",
          method_name: "vitamin_d",
          unit: "g"
        },
        {
          code: "NA",
          name: "Sodium",
          method_name: "sodium",
          unit: "mg"
        },
        {
          code: "VITK1",
          name: "Vitamin K",
          method_name: "vitamin_k",
          unit: "g"
        }
      ].freeze

      def initialize(total_nutrients:)
        @total_nutrients = total_nutrients

        NUTRIENT_REFERENCE.each do |nutrient|
          instance_variable_set("@#{nutrient[:method_name]}", total_nutrients[nutrient[:code]])
        end
      end


      NUTRIENT_REFERENCE.each do |nutrient|
        define_method(nutrient[:method_name]) do
          method_name = "@#{nutrient[:method_name]}"

          if instance_variable_defined? method_name
            instance_variable_get(method_name)
          else
            "Does not contain related information."
          end
        end
      end

      private

      attr_reader :total_nutrients
    end
  end
end
