# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :places

  validates_presence_of :name
end
