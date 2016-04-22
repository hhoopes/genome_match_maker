require 'rails_helper'

RSpec.describe Location, type: :model do
  it { should have_many :snp_values }
  it { should validate_uniqueness_of :position }
end
