require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company)do
    Company.new(name: "company name")
  end
  
  it 'is valid' do
    expect(company).to be_valid
  end
  
  it 'is not valid without a name' do
    company.name = nil
    
    expect(company).to_not be_valid
  end
end
