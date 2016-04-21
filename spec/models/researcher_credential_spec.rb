require 'rails_helper'

RSpec.describe ResearcherCredential, type: :model do
  it { should belong_to :user }
end
