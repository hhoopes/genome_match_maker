require 'rails_helper'

RSpec.describe SnpValue, type: :model do
  it {should have_many :snps }
  it {should have_many :studies }
end
