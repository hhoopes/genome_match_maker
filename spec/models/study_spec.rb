require 'rails_helper'

RSpec.describe Study, type: :model do
  it { should accept_nested_attributes_for :snps }
  it { should belong_to :user }
  it { should have_many :snp_values }

  # expect(matching_study.snps.last.snp_value).to
  #     eq(participant.snp_values.where(location:
  #                               {position: "rs3094315"}))

end
