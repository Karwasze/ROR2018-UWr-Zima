# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :places

  validates_presence_of :name
end
