class User < ActiveRecord::Base
  has_one :license, dependent: :destroy
  accepts_nested_attributes_for :license

  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, on: :create }
  validates :name, presence: true

  def form_validation
    errors.add(:name)
    errors.add(:email)
  end

end
