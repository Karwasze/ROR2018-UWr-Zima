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

require 'rails_helper'

RSpec.describe Place, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
