Given /^I am on the home page$/ do
	visit root_path
end

Given /^I have users named "(.*)"$/ do |names|
	names.split(", ").each do |name|
		FactoryGirl.create(:user, :name => name)
	end
end

Then /^I should see "(.*)"$/ do |names|
	names.split(", ").each do |name|
		page.should have_content name
	end
end 

Then /^I should not see "(.*)"$/ do |names|
	names.split(", ").each do |name|
		page.should_not have_content name
	end
end