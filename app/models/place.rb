# frozen_string_literal: true
# == Schema Information
#
# Table name: places
#
#  id               :bigint(8)        not null, primary key
#  name             :string
#  description      :text
#  long_description :text
#  price            :decimal(, )
#  category_id      :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  country_id       :bigint(8)
#

class Place < ApplicationRecord
  belongs_to :category
  belongs_to :country

  validates_presence_of :name, :description
  validates :price, numericality: { greater_than: 0.0 }
  validates :category, presence: true
  validates :country, presence: true
end
