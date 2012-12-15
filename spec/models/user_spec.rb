require 'spec_helper'

describe User do
 fixtures :users
  
it "" do
    user=users(:alex)
    user.bio = "New Bio"
    user.should be_valid
  end
 
end