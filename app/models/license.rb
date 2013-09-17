class License < ActiveRecord::Base
  validates :state, length: { is: 2 }, format: { with: /\A[a-zA-Z]+\z/, on: :create }
  belongs_to :user
end
