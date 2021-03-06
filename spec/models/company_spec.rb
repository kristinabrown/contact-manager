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
  
  it "has an array of phone numbers" do
    phone_number = company.phone_numbers.build(number: "333-4444")
    expect(phone_number.number).to eq('333-4444')
  end
  
  it "has an array of email addresses" do
    expect(company.email_addresses).to eq([])
  end
  
  it "converts to name when turned to string" do
    expect(company.to_s).to eq("company name")
  end
end
