class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def birthdate_br
    I18n.l(birthdate) unless birthdate.blank?
  end

  def kind_description
    kind.description
  end

  def to_br
    {
      name: name,
      email: email,
      birthdate: (I18n.l(birthdate) unless birthdate.blank?)
    }
  end

  def as_json(options = {})
    h = super(options)
    h[:birthdate] = (I18n.l(birthdate) unless birthdate.blank?)
    h
  end
end
