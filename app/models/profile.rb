class Profile < ApplicationRecord
  has_paper_trail
  validates_presence_of :first_name, :last_name, :email, :t_shirt_size, :age_group
  validates :code_of_conduct, acceptance: true

  # Someone cannot have the same name (first/last) and have the same postal/address
  validates_uniqueness_of [:postal_code, :address], scope: [:first_name, :last_name]

  validates :postal_code, format: {
    with: /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ ]?\d{1}[A-Z]{1}\d{1}\z/i,
    message: "has the wrong format: K1A1A1 or K1A 1A1"
  }, allow_blank: true

  validates :age_group, inclusion: {
    in: ['14-17', '18-24', '25-55', '55+'],
    message: '%{value} is not a valid age group'
  }

  validates :t_shirt_size, inclusion: {
    in: %w(XS S M L XL 2XL 3XL),
    message: '%{value} is not a valid size'
  }

  def postal_code=(val)
    self[:postal_code] = val.upcase
  end
end
