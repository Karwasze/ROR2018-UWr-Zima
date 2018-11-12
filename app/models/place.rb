# frozen_string_literal: true

class Place < ApplicationRecord
  belongs_to :category
  belongs_to :country

  validates_presence_of :name, :description
  validates :price, numericality: { greater_than: 0.0 }
  validates :category, presence: true
  validates :country, presence: true
end
