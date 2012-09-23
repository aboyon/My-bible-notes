require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
   test "the truth" do
     assert true
   end

   test "name cant be null" do
   	user = User.new( :name => nil)
   	assert !user.save, "user name can't be null"
   end

   test "create note for user" do
   	user = User.first
   	user.notes.create(:passage => 'Juan 3:16', :comment => 'Mi salvacion', :public => true)
   	assert user.save
   end
end
