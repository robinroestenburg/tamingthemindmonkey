Given 'I am not logged in' do
  # noop
end

When 'I navigate to the admin backend' do
  visit_admin_backend
end

Then 'I should see a login page' do
  save_and_open_page
  page.should have_content 'Log in'
end

Given 'I want to view the admin backend' do
  visit_admin_backend
end

When 'I enter valid login credentials' do
  pending
end

Then 'I should be allowed to the view the admin backend' do
  pending
end

When 'I enter invalid login credentials' do
  pending
end

Then 'I should not be allowed to view the admin backend' do
  pending
end

def visit_admin_backend
  visit '/admin'
end
