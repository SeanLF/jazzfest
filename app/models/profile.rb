class Profile < ApplicationRecord
  has_many :opportunity_applications

  has_paper_trail
  validates_presence_of :first_name, :last_name, :email, :t_shirt_size, :age_group
  validates :code_of_conduct, acceptance: true

  # Someone cannot have the same name (first/last) and have the same postal/address
  validates_uniqueness_of %i[postal_code address], scope: %i[first_name last_name]

  validates :postal_code, format: {
    with: /\A[ABCEGHJKLMNPRSTVXY]{1}\d{1}[A-Z]{1}[ ]?\d{1}[A-Z]{1}\d{1}\z/i,
    message: 'has the wrong format: K1A1A1 or K1A 1A1'
  }, allow_blank: true

  validates :age_group, inclusion: {
    in: ['14-17', '18-24', '25-55', '55+'],
    message: '%{value} is not a valid age group'
  }

  validates :t_shirt_size, inclusion: {
    in: %w[XS S M L XL 2XL 3XL],
    message: '%{value} is not a valid size'
  }

  class << self
    def with_published_opportunity_applications
      joins(:opportunity_applications).where(opportunity_applications: { submitted: true })
    end
  end

  def postal_code=(val)
    self[:postal_code] = val.upcase
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def t_shirt_size_for_export
    case t_shirt_size
    when '2XL' then 'XXL'
    when '3XL' then 'XXXL'
    else t_shirt_size
    end
  end

  def province_for_export
    case province
    when 'Ontario' then 'ON'
    when 'Quebec' then 'QC'
    end
  end
end
