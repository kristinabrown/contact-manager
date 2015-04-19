require 'rails_helper'

describe 'the company view', type: :feature do
  
let(:company) { Company.create(name: "Apple") }
  
  describe 'phone numbers', type: :feature do
    
    before(:each) do 
      company.phone_numbers.create(number: "5554443333")
      company.phone_numbers.create(number: "7774443333")
      
      visit company_path(company)
    end
    
    it 'shows the companies phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_content(phone.number)
      end
    end
    
    it 'has a link to add more numbers' do
      expect(page).to have_link("Add phone number", href: new_phone_number_path(contact_id: company.id, contact_type: "Company"))
    end
    
    it 'adds a new phone number' do
      page.click_link('Add phone number')
      page.fill_in('Number', with: '555-8888')
      page.click_button('Create Phone number')
      
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-8888')
    end
    
    it 'has a link to edit phone numbers' do
      company.phone_numbers.each do |phone|
        expect(page).to have_link('edit', href: edit_phone_number_path(phone))
      end
    end
    
    it 'edits a phone number' do
      phone = company.phone_numbers.first
      old_number = phone.number
      first(:link, 'edit').click
      
      page.fill_in('Number', with: '555-9191')
      page.click_button('Update Phone number')
      
      expect(current_path).to eq(company_path(company))
      expect(page).to have_content('555-9191')
      
      expect(page).to_not have_content(old_number)
    end
    
    it 'deletes a phone number' do
      phone = company.phone_numbers.first
      phone_number = phone.number
      
      first(:link, 'delete').click
      
      expect(current_path).to eq(company_path(company))
      expect(page).to_not have_content(phone_number)
    end
  end
end