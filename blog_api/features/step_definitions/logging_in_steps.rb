Given 'I am not logged in' do
  # noop
end

Given 'there is a registered admin' do
  @admin = Admin.create!(email: 'foo@example.com', password: '123456')
end

When 'I log in as that user' do
  post '/admin/admins/sign_in', { action: 'create', user_login: { email: 'foo@example.com', password: '123456' } } 
end

Then 'I should be able to access a protected resource' do
  page = JSON.parse(last_response.body)
  page['auth_token'].should_not be_nil

  pending
end
