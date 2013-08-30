Feature: UserFeature

  In order to manage users
  An admin
  wants to successfully visit home page, list users and create a valid user

	Scenario: foo
		Given I am on the home page
		Then I should see "Users"


	Scenario: Users List
		Given I have users named "Mario, Luigi"
		When I am on the home page
		Then I should see "Mario, Luigi"
		And I should not see "Paolo"

	# Scenario: Create a valid user
	# 	Given I have users named "Mario, Luigi"
	# 	When I am on the home page
	# 	Then I should see "New" link
	# 	Then I should see "Mario, Luigi"
	# 	#And I should see "Luigi"
	# 	And I should not see "Paolo"