require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) { PhoneNumber.new(number: "3334445555", person_id: 1) }
  
  it 'is a valid number' do
    expect(phone_number).to be_valid
  end
  
  it 'is invalid without a number' do
    phone_number.number = nil
    
    expect(phone_number).to_not be_valid
  end
  
  it 'must have a reference to a number' do
    phone_number.person_id = nil
    
    expect(phone_number).to_not be_valid
  end
    
end
