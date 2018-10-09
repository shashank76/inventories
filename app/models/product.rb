class Product < ApplicationRecord

	has_one :image, as: :imageable, dependent: :destroy
end
