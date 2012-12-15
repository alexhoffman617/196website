require 'spec_helper'

describe Post do
 fixtures :posts
  
 #used while trying to figure out voting 
it "" do
    post=posts(:post)
    post.likes+=1
    post.should be_valid
  end
 
end