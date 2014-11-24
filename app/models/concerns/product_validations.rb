module ProductValidations
  extend ActiveSupport::Concern

  included do
    validates :name, presence: true
    validates :price, numericality: {greater_than_or_equal_to: 0.01}
  end
end