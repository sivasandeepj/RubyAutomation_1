Given(/^User is on the landing-page$/) do
 on(LandingPage).navigate_to_landing_page
end

When(/^User "(.+)" as "(.+)"$/) do |_action,_user|
  case _action
  when 'logs in'
    on(LandingPage).btn_login
    on(LoginPage).login_as_user(_user)
  when 'signs up'
    on(LandingPage).btn_singup
  end
end

And (/^navigates to "(.+)" from "(.+)"$/) do |_destination_page, _from_navigation_element|
  on(OverviewPage).navigate_via_settings(_destination_page, _from_navigation_element)
end

And (/^"(.+)" "(.+)" information for "(.+)" fields$/) do |_user, _action , _fields|
  on(UserInfo).perform_user_action_on_field(_user, _action, _fields)
end

Then (/^information regarding "(.+)" is "(.+)"$/) do |_fields, _action|
  on(UserInfo).verify_information_is_updated
end

And(/^filters "(.+)" as "(.+)"$/)do |_dropdown, _value|
on(ProjectOperations).filter_dropdown(_dropdown, _value)
end

Then(/^there are "(.+)" operations to display$/) do |_value|
  on(ProjectOperations).verify_operations_dropdown_value(_value)
end