require 'rails_helper'

RSpec.describe Study, type: :model do
  it { should accept_nested_attributes_for :snps }
  it { should belong_to :user }
  it { should have_many :snp_values }
end
