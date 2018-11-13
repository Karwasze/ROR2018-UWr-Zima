# frozen_string_literal: true

# == Schema Information
#
# Table name: countries
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Country < ApplicationRecord
  has_many :places

  validates_presence_of :name
end
