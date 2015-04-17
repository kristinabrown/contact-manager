require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email_address) { EmailAddress.new(address: "example@example.org") }
  
  it 'is a valid email address' do
    expect(email_address).to be_valid
  end
  
  it 'is valid without an address' do
    email_address.address = nil
    
    expect(email_address).to_not be_valid
  end
end
