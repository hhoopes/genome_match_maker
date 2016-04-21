require 'rails_helper'

RSpec.describe Snp, type: :model do
  it { should accept_nested_attributes_for :snp_value }
  it { should belong_to :snp_value }
end
