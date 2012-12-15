require 'spec_helper'

describe "Users" do
  describe "GET /users" do
    
    before do
      visit users_path
      click_link "New User"
  
    end
   
    it "", js:true do
      fill_in "Email", with: "alex@test.com"
      fill_in "Password", with: "test1234"
      click_on "Sign in"
      
      page.should have_content "successful"
    end
    
  end
end
