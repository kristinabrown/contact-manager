require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:person) { Person.create(:first_name => "Jimbob", :last_name => "Billy") }
  let(:phone_number) { PhoneNumber.new(number: "3334445555", contact_id: person.id, contact_type: "Person") }
  
  it 'is a valid number' do
    expect(phone_number).to be_valid
  end
  
  it 'is invalid without a number' do
    phone_number.number = nil
    
    expect(phone_number).to_not be_valid
  end
  
  it 'must have a reference to a person' do
    phone_number.contact_id = nil
    
    expect(phone_number).to_not be_valid
  end
  
  it "has an associated contact" do 
    expect(phone_number).to respond_to(:contact)
  end
    
end
